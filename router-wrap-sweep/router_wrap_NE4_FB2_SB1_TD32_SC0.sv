// (* whitebox *)
module axis_router #(

// parameters for sweep
    parameter NUM_PORTS = 5,
    parameter NOC_NUM_ENDPOINTS = 4, // rows * cols
    parameter FLIT_BUFFER_DEPTH = 2,
    parameter SERDES_BUFFER_DEPTH = 1,

    parameter TID_WIDTH = 2,
    parameter TDEST_WIDTH = 2,
    parameter TDATA_WIDTH = 32,

    parameter SERIALIZATION_FACTOR = 1,
    parameter CLKCROSS_FACTOR = 1,
    parameter bit SINGLE_CLOCK = 0,

// fixed parameters     
    parameter RESET_SYNC_EXTEND_CYCLES = 2,
    parameter RESET_NUM_OUTPUT_REGISTERS = 1,
    parameter SERDES_IN_BUFFER_DEPTH = SERDES_BUFFER_DEPTH,
    parameter SERDES_OUT_BUFFER_DEPTH = SERDES_BUFFER_DEPTH,
    parameter SERDES_EXTRA_SYNC_STAGES = 0,
    parameter SERDES_FORCE_MLAB = 0,

    // parameter ROUTING_TABLE_HEX = "routing_tables/router_4x4/",

    parameter bit ROUTER_PIPELINE_ROUTE_COMPUTE = 1,
    parameter bit ROUTER_PIPELINE_ARBITER = 0,
    parameter bit ROUTER_PIPELINE_OUTPUT = 0,
    parameter bit ROUTER_FORCE_MLAB = 0,

    parameter FLIT_WIDTH = TDATA_WIDTH / SERIALIZATION_FACTOR / CLKCROSS_FACTOR,
    parameter DEST_WIDTH = TDEST_WIDTH + TID_WIDTH,

    parameter RTR_ADDR_WIDTH=4,
    parameter ROUTE_WIDTH=3,

    parameter NUM_PIPELINE = 0
) (
    input   wire    clk_noc,
    input   wire    clk_usr,
    input   wire    rst_n,


//  NORTH = 1;
//  SOUTH = 2;
//  EAST = 3;
//  WEST = 4;
    // rtr-to-rtr ports
    input   wire    [0:NUM_PORTS - 2][FLIT_WIDTH - 1 : 0]    data_in,
    input   wire    [0:NUM_PORTS - 2][DEST_WIDTH - 1 : 0]    dest_in     ,
    input   wire    [0:NUM_PORTS - 2]                        is_tail_in  ,
    input   wire    [0:NUM_PORTS - 2]                        send_in     ,
    output  logic   [0:NUM_PORTS - 2]                        credit_out  ,

    output  logic   [0:NUM_PORTS - 2][FLIT_WIDTH - 1 : 0]    data_out    ,
    output  logic   [0:NUM_PORTS - 2][DEST_WIDTH - 1 : 0]    dest_out    ,
    output  logic   [0:NUM_PORTS - 2]                        is_tail_out ,
    output  logic   [0:NUM_PORTS - 2]                        send_out    ,
    input   wire    [0:NUM_PORTS - 2]                        credit_in   ,
    input   bit         [0:NUM_PORTS-1][0:NUM_PORTS-1]           DISABLE_TURNS ,



    // injection port
    input   wire                            axis_in_tvalid,
    output  logic                           axis_in_tready,
    input   wire    [TDATA_WIDTH - 1 : 0]   axis_in_tdata,
    input   wire                            axis_in_tlast,
    input   wire    [TID_WIDTH - 1 : 0]     axis_in_tid,
    input   wire    [TDEST_WIDTH - 1 : 0]   axis_in_tdest,
    output  logic                           axis_out_tvalid,
    input   wire                            axis_out_tready,
    output  logic   [TDATA_WIDTH - 1 : 0]   axis_out_tdata,
    output  logic                           axis_out_tlast,
    output  logic   [TID_WIDTH - 1 : 0]     axis_out_tid,
    output  logic   [TDEST_WIDTH - 1 : 0]   axis_out_tdest,

    input  wire     [RTR_ADDR_WIDTH-1 : 0] router_address
);


    logic   rst_n_noc_sync, rst_n_usr_sync;
    logic   rst_noc_sync, rst_usr_sync;

    logic   local_axis_in_tvalid;
    logic   local_axis_in_tready;
    logic   [TDATA_WIDTH - 1 : 0] local_axis_in_tdata;
    logic   local_axis_in_tlast;
    logic   [TID_WIDTH - 1 : 0] local_axis_in_tid;
    logic   [TDEST_WIDTH - 1 : 0] local_axis_in_tdest;

    logic   local_axis_out_tvalid;
    logic   local_axis_out_tready;
    logic   [TDATA_WIDTH - 1 : 0] local_axis_out_tdata;
    logic   local_axis_out_tlast;
    logic   [TID_WIDTH - 1 : 0] local_axis_out_tid;
    logic   [TDEST_WIDTH - 1 : 0] local_axis_out_tdest;

    logic   [FLIT_WIDTH - 1 : 0]    local_data_in;
    logic   [DEST_WIDTH  - 1 : 0]   local_dest_in;
    logic                           local_is_tail_in;
    logic                           local_send_in;
    logic                           local_credit_out;

    logic   [FLIT_WIDTH - 1 : 0]    local_data_out;
    logic   [DEST_WIDTH - 1 : 0]    local_dest_out;
    logic                           local_is_tail_out;
    logic                           local_send_out;
    logic                           local_credit_in;

    assign rst_n_noc_sync = ~rst_noc_sync;
    assign rst_n_usr_sync = ~rst_usr_sync;

    reset_synchronizer #(
        .NUM_EXTEND_CYCLES(RESET_SYNC_EXTEND_CYCLES),
        .NUM_OUTPUT_REGISTERS(RESET_NUM_OUTPUT_REGISTERS)
    ) usr_sync (
        .reset_async    (~rst_n),
        .sync_clk       (clk_usr),
        .reset_sync     (rst_usr_sync)
    );

    reset_synchronizer #(
        .NUM_EXTEND_CYCLES(RESET_SYNC_EXTEND_CYCLES),
        .NUM_OUTPUT_REGISTERS(RESET_NUM_OUTPUT_REGISTERS)
    ) noc_sync (
        .reset_async    (~rst_n),
        .sync_clk       (clk_noc),
        .reset_sync     (rst_noc_sync)
    );

    // AXI shims
    axis_serializer_shim_in #(
        .TDEST_WIDTH            (DEST_WIDTH),
        .TDATA_WIDTH            (TDATA_WIDTH),
        .SERIALIZATION_FACTOR   (SERIALIZATION_FACTOR),
        .CLKCROSS_FACTOR        (CLKCROSS_FACTOR),
        .SINGLE_CLOCK           (SINGLE_CLOCK),
        .BUFFER_DEPTH           (SERDES_IN_BUFFER_DEPTH),
        .FLIT_BUFFER_DEPTH      (FLIT_BUFFER_DEPTH),
        .EXTRA_SYNC_STAGES      (SERDES_EXTRA_SYNC_STAGES),
        .FORCE_MLAB             (SERDES_FORCE_MLAB)
    ) axi_shim_in (
        .clk_usr        (clk_usr),
        .clk_noc        (clk_noc),
        .rst_n_usr_sync (rst_n_usr_sync),
        .rst_n_noc_sync (rst_n_noc_sync),
        .axis_tvalid    (axis_in_tvalid),
        .axis_tready    (axis_in_tready),
        .axis_tdata     (axis_in_tdata),
        .axis_tlast     (axis_in_tlast),
        .axis_tdest     ({axis_in_tid, axis_in_tdest}),
        .data_out       (local_data_in),
        .dest_out       (local_dest_in),
        .is_tail_out    (local_is_tail_in),
        .send_out       (local_send_in),
        .credit_in      (local_credit_out)
    );

    axis_deserializer_shim_out #(
        .TDEST_WIDTH            (DEST_WIDTH),
        .TDATA_WIDTH            (TDATA_WIDTH),
        .SERIALIZATION_FACTOR   (SERIALIZATION_FACTOR),
        .CLKCROSS_FACTOR        (CLKCROSS_FACTOR),
        .SINGLE_CLOCK           (SINGLE_CLOCK),
        .BUFFER_DEPTH           (SERDES_OUT_BUFFER_DEPTH),
        .FLIT_BUFFER_DEPTH      (FLIT_BUFFER_DEPTH),
        .EXTRA_SYNC_STAGES      (SERDES_EXTRA_SYNC_STAGES),
        .FORCE_MLAB             (SERDES_FORCE_MLAB)
    ) axi_shim_out (
        .clk_usr        (clk_usr),
        .clk_noc        (clk_noc),
        .rst_n_usr_sync (rst_n_usr_sync),
        .rst_n_noc_sync (rst_n_noc_sync),
        .axis_tvalid    (local_axis_out_tvalid),
        .axis_tready    (local_axis_out_tready),
        .axis_tdata     (local_axis_out_tdata),
        .axis_tlast     (local_axis_out_tlast),
        .axis_tdest     ({local_axis_out_tid, local_axis_out_tdest}),
        .data_in        (local_data_out),
        .dest_in        (local_dest_out),
        .is_tail_in     (local_is_tail_out),
        .send_in        (local_send_out),
        .credit_out     (local_credit_in)
    );

    assign local_axis_in_tvalid  = axis_in_tvalid;
    assign local_axis_in_tdata   = axis_in_tdata;
    assign local_axis_in_tlast   = axis_in_tlast;
    assign local_axis_in_tid     = axis_in_tid;
    assign local_axis_in_tdest   = axis_in_tdest;

    assign axis_out_tvalid = local_axis_out_tvalid;
    assign axis_out_tready = local_axis_out_tready;
    assign axis_out_tdata  = local_axis_out_tdata;
    assign axis_out_tlast  = local_axis_out_tlast;
    assign axis_out_tid    = local_axis_out_tid;
    assign axis_out_tdest  = local_axis_out_tdest;

    // // localparam string routing_table = $sformatf("%s/table.hex", ROUTING_TABLE_PREFIX);
    // bit DISABLE_TURNS[NUM_PORTS][NUM_PORTS];
    // always_comb begin
    //     for (int i = 0; i < NUM_PORTS; i = i + 1) begin
    //         for (int j = 0; j < NUM_PORTS - 1; j = j + 1) begin
    //             DISABLE_TURNS[i][j] = 0;
    //         end
    //     end
    // end

    logic [0:NUM_PORTS-1][FLIT_WIDTH - 1 : 0] data_in_combined;
    logic [0:NUM_PORTS-1][DEST_WIDTH - 1 : 0] dest_in_combined;
    logic [0:NUM_PORTS-1]is_tail_in_combined;
    logic [0:NUM_PORTS-1]send_in_combined;
    logic [0:NUM_PORTS-1]credit_out_combined;

    generate
        genvar k;
        for (k = 0; k < NUM_PORTS - 1; k++) begin
            assign data_in_combined[k+1] = data_in[k];
            assign dest_in_combined[k+1] = dest_in[k];
            assign is_tail_in_combined[k+1] = is_tail_in[k];
            assign send_in_combined[k+1] = send_in[k];
            assign credit_out[k] = credit_out_combined[k+1];
            // assign credit_out_combined[k] = credit_out[k];
        end
        assign data_in_combined[0] = local_data_in;
        assign dest_in_combined[0] = local_dest_in;
        assign is_tail_in_combined[0] = local_is_tail_in;
        assign send_in_combined[0] = local_send_in;
        assign local_credit_out = credit_out_combined[0];
        // assign credit_out_combined[NUM_PORTS - 1] = local_credit_out;
    endgenerate

    logic [0:NUM_PORTS-1][FLIT_WIDTH - 1 : 0] data_out_combined;
    logic [0:NUM_PORTS-1][DEST_WIDTH - 1 : 0] dest_out_combined;
    logic [0:NUM_PORTS-1]is_tail_out_combined;
    logic [0:NUM_PORTS-1]send_out_combined;
    logic [0:NUM_PORTS-1]credit_in_combined;

    // noc pipeline links
    generate
        genvar m;
        for (m = 0; m < NUM_PORTS - 1; m++) begin: noc_links
            // noc_pipeline_link #(
            //     .NUM_PIPELINE(NUM_PIPELINE),
            //     .FLIT_WIDTH(FLIT_WIDTH),
            //     .DEST_WIDTH(DEST_WIDTH)
            // ) noc_link (
            //     .clk(clk_noc ),
            //     .data_in(data_out_combined[m+1]),
            //     .dest_in(dest_out_combined[m+1]),
            //     .is_tail_in(is_tail_out_combined[m+1]),
            //     .send_in(send_out_combined[m+1]),
            //     .credit_out(credit_in[m]),
            //     .data_out(data_out[m]),
            //     .dest_out(dest_out[m]),
            //     .is_tail_out(is_tail_out[m]),
            //     .send_out(send_out[m]),
            //     .credit_in(credit_in_combined[m+1])
            // );

            assign data_out[m] = data_out_combined[m+1];
            assign dest_out[m] = dest_out_combined[m+1];
            assign is_tail_out[m] = is_tail_out_combined[m+1];
            assign send_out[m] = send_out_combined[m+1];
            // assign credit_in[m] = credit_in_combined[m+1];
            assign credit_in_combined[m+1] = credit_in[m];
        end

        assign local_data_out  = data_out_combined[0];
        assign local_dest_out  = dest_out_combined[0];
        assign local_is_tail_out  =  is_tail_out_combined[0];
        assign local_send_out  = send_out_combined[0];
        assign credit_in_combined[0] = local_credit_in;
        // assign local_credit_in  =  credit_out_combined[NUM_PORTS - 1];
    endgenerate

    logic [NOC_NUM_ENDPOINTS - 1:0][ROUTE_WIDTH - 1 : 0] routing_table ;

routing_table #(
    .NUM_ROWS(2),  
    .NUM_COLS(2),  
    .NUM_OUTPUTS(NUM_PORTS), 
    .ROUTE_WIDTH(ROUTE_WIDTH),
    .RTR_ADDR_WIDTH(RTR_ADDR_WIDTH)
) rtr_table (
    .router_address(router_address),
    .routing_table(routing_table) 
);

    router #(
        .NOC_NUM_ENDPOINTS      (NOC_NUM_ENDPOINTS),
        // .ROUTING_TABLE_HEX      (ROUTING_TABLE_HEX),
        .NUM_INPUTS             (NUM_PORTS),
        .NUM_OUTPUTS            (NUM_PORTS),
        .DEST_WIDTH             (DEST_WIDTH),
        .FLIT_WIDTH             (FLIT_WIDTH),
        .FLIT_BUFFER_DEPTH      (FLIT_BUFFER_DEPTH),
        .PIPELINE_ROUTE_COMPUTE (ROUTER_PIPELINE_ROUTE_COMPUTE),
        .PIPELINE_ARBITER       (ROUTER_PIPELINE_ARBITER),
        .PIPELINE_OUTPUT        (ROUTER_PIPELINE_OUTPUT),
        .FORCE_MLAB             (ROUTER_FORCE_MLAB)
    ) router_inst (
        .clk            (clk_noc),
        .rst_n          (rst_n_noc_sync),

        .data_in        (data_in_combined),
        .dest_in        (dest_in_combined),
        .is_tail_in     (is_tail_in_combined),
        .send_in        (send_in_combined),
        .credit_out     (credit_out_combined),

        .data_out       (data_out_combined),
        .dest_out       (dest_out_combined),
        .is_tail_out    (is_tail_out_combined),
        .send_out        (send_out_combined),
        .credit_in        (credit_in_combined),

        .route_table    (routing_table),

        .DISABLE_TURNS  (DISABLE_TURNS)
    );

endmodule: router_wrap





