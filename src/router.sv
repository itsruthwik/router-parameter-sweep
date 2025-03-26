/**
 * @file router.sv
 *
 * @brief Main NoC router
 *
 * @author Shashank Obla
 * Contact: sobla@andrew.cmu.edu
 *
 */

`timescale 1ns/1ps

module router #(
    parameter NOC_NUM_ENDPOINTS = 5,
    parameter ROUTING_TABLE_HEX = "routing_tables/router_tb_5x5.hex",
    parameter NUM_INPUTS = 5,
    parameter NUM_OUTPUTS = 5,
    parameter ROUTE_WIDTH = 3,
    parameter DEST_WIDTH = 3,
    parameter FLIT_WIDTH = 32,
    parameter FLIT_BUFFER_DEPTH = 2,
    parameter bit PIPELINE_ROUTE_COMPUTE = 0,
    parameter bit PIPELINE_ARBITER = 0,
    parameter bit PIPELINE_OUTPUT = 0,
    parameter bit FORCE_MLAB = 1
) (
    input   wire    clk,
    input   wire    rst_n,

    input   wire    [0:NUM_INPUTS-1][FLIT_WIDTH - 1 : 0]    data_in    ,
    input   wire    [0:NUM_INPUTS-1][DEST_WIDTH - 1 : 0]    dest_in    ,
    input   wire    [0:NUM_INPUTS-1]                        is_tail_in ,
    input   wire    [0:NUM_INPUTS-1]                        send_in    ,
    output  logic   [0:NUM_INPUTS-1]                        credit_out ,

    output  logic   [0:NUM_OUTPUTS-1][FLIT_WIDTH - 1 : 0]    data_out   ,
    output  logic   [0:NUM_OUTPUTS-1][DEST_WIDTH - 1 : 0]    dest_out   ,
    output  logic   [0:NUM_OUTPUTS-1]                        is_tail_out,
    output  logic   [0:NUM_OUTPUTS-1]                        send_out   ,
    input   wire    [0:NUM_OUTPUTS-1]                        credit_in  ,

    input logic [0:NOC_NUM_ENDPOINTS-1][ROUTE_WIDTH - 1 : 0]  route_table,

    input   bit    [0:NUM_INPUTS-1][0:NUM_OUTPUTS-1]                         DISABLE_TURNS 
);
    /**************************************************************************/
    /****************************** Declarations ******************************/
    /**************************************************************************/

    // Routing Tables
    // logic [$clog2(NUM_OUTPUTS) - 1 : 0]         route_table         [NOC_NUM_ENDPOINTS];  // Replicated for each input
    logic [0:NUM_INPUTS-1][$clog2(NUM_OUTPUTS) - 1 : 0]         route_table_out   ;
    logic [0:NUM_INPUTS-1][$clog2(NUM_OUTPUTS) - 1 : 0]         route_sa_reg      ;
    logic [0:NUM_INPUTS-1][$clog2(NOC_NUM_ENDPOINTS) - 1 : 0]   route_table_select;

    // Router state
    logic receiving_packet[NUM_INPUTS], transiting_packet[NUM_INPUTS];

    // Dest buffer FIFO signals
    logic [0:NUM_INPUTS-1][DEST_WIDTH - 1 : 0]  dest_buffer_out   ;
    logic [0:NUM_INPUTS-1]                      dest_buffer_empty ;
    logic [0:NUM_INPUTS-1]                      dest_buffer_rdreq ;

    // Flit buffer FIFO signals
    logic [0:NUM_INPUTS-1][FLIT_WIDTH - 1 : 0]  flit_buffer_out;
    logic [0:NUM_INPUTS-1]                      tail_buffer_out;
    logic [0:NUM_INPUTS-1]                      tail_buffer_empty;
    logic [0:NUM_INPUTS-1]                      flit_buffer_rdreq;
    logic [0:NUM_INPUTS-1]                      tail_buffer_rdreq;
    logic [0:NUM_INPUTS-1]                      tail_buffer_valid;

    // Arbiter signals
    logic [0:NUM_OUTPUTS-1][NUM_INPUTS - 1 : 0] request     ;
    logic [0:NUM_OUTPUTS-1][NUM_INPUTS - 1 : 0] hold        ;
    logic [0:NUM_OUTPUTS-1][NUM_INPUTS - 1 : 0] grant       ;
    logic [0:NUM_OUTPUTS-1][NUM_INPUTS - 1 : 0] grant_mask  ;
    logic [0:NUM_OUTPUTS-1][NUM_INPUTS - 1 : 0] grant_reg   ;
    logic [NUM_INPUTS - 1 : 0] grant_input;

    // Route Compute output pipeline signals
    // logic [FLIT_WIDTH - 1: 0]                       flit_rc_reg_flit[NUM_INPUTS];
    logic [0:NUM_INPUTS-1][DEST_WIDTH - 1: 0]                       flit_rc_reg_dest;
    logic [0:NUM_INPUTS-1]                                          flit_rc_reg_is_tail;
    logic [0:NUM_INPUTS-1][$clog2(FLIT_BUFFER_DEPTH + 2) - 1: 0]    rc_reg_credit_proxy;
    logic [0:NUM_INPUTS-1]                                          flit_rc_reg_valid;
    logic [0:NUM_INPUTS-1]                                          rc_pipeline_enable;

    // Switch Allocation output pipeline signals (Unpacked for easier debugging)
    logic [0:NUM_INPUTS-1][FLIT_WIDTH + DEST_WIDTH + 1 - 1: 0]      flit_sa_reg;
    // logic [0:NUM_INPUTS-1][FLIT_WIDTH - 1: 0]                       flit_sa_reg_flit;
    logic [0:NUM_INPUTS-1][DEST_WIDTH - 1: 0]                       flit_sa_reg_dest;
    logic [0:NUM_INPUTS-1]                                          flit_sa_reg_is_tail;
    logic [0:NUM_INPUTS-1]                                          flit_sa_reg_valid;
    logic [0:NUM_INPUTS-1]                                          sa_pipeline_enable;


    // Crossbar signals (Unpacked for easier debugging)
    logic [0:NUM_OUTPUTS-1][FLIT_WIDTH + DEST_WIDTH + 1 - 1: 0]  data_out_packed;
    logic [0:NUM_OUTPUTS-1][FLIT_WIDTH - 1: 0]                   data_out_flit;
    logic [0:NUM_OUTPUTS-1][DEST_WIDTH - 1: 0]                   data_out_dest;
    logic [0:NUM_OUTPUTS-1]                                      data_out_is_tail;
    logic [0:NUM_OUTPUTS-1]                                      flit_out_valid;

    // Output pipeline signals (Unpacked for easier debugging)
    logic [0:NUM_OUTPUTS-1][FLIT_WIDTH + DEST_WIDTH + 1 - 1: 0]  data_out_reg;
    logic [0:NUM_OUTPUTS-1][FLIT_WIDTH - 1: 0]                   data_out_reg_flit;
    logic [0:NUM_OUTPUTS-1][DEST_WIDTH - 1: 0]                   data_out_reg_dest;
    logic [0:NUM_OUTPUTS-1]                                      data_out_reg_is_tail;
    logic [0:NUM_OUTPUTS-1]                                      data_out_reg_valid;

    // Output credit counter
    logic [0:NUM_OUTPUTS-1][$clog2(FLIT_BUFFER_DEPTH + 1) - 1 : 0]   credit_counter     ;
    logic [0:NUM_OUTPUTS-1][$clog2(FLIT_BUFFER_DEPTH + 1) - 1 : 0]   credit_counter_in  ;
    logic [0:NUM_OUTPUTS-1][$clog2(FLIT_BUFFER_DEPTH + 2) - 1 : 0]   credit_counter_plus;

    /**************************************************************************/
    /********************************** Intial ********************************/
    /**************************************************************************/

    // Read the routing table into the ROM
    // initial begin
    //     // Make explicit one routing table for all inputs
    //     // Use generate statements to create multiple inital blocks/
    //     // for Quartus to do the right thing (otherwise it only runs the
    //     // first iteration of the for loop inside the initial statement
    //     // and all other routing tables are empty...)
    //     $readmemh(ROUTING_TABLE_HEX, route_table);
    // end

    /**************************************************************************/
    /********************************** Logic *********************************/
    /**************************************************************************/

    // Input generate
    generate
        genvar i, j;
        for (i = 0; i < NUM_INPUTS; i++) begin: input_assign_gen
            // Read flit buffer when the pipeline is free
            assign tail_buffer_rdreq[i] = ~tail_buffer_empty[i] & (rc_pipeline_enable[i] | ~tail_buffer_valid[i]);

            // Generate credits based on flit buffer reads
            assign credit_out[i] = flit_buffer_rdreq[i];

            // Read dest buffer when a new packet begins
            assign dest_buffer_rdreq[i] = tail_buffer_rdreq[i] & ~(transiting_packet[i] & ~tail_buffer_out[i]);

            // Index into the routing table using the destination
            assign route_table_select[i] = dest_buffer_out[i][$clog2(NOC_NUM_ENDPOINTS) - 1 : 0];

            // Generate pipeline enable based on credits
            assign sa_pipeline_enable[i] = (rc_reg_credit_proxy[i] > (PIPELINE_ARBITER ? 1 : 0)) & grant_input[i];
        end

        for (i = 0; i < NUM_OUTPUTS; i++) begin: output_assign_gen
            // Unpack the crossbar output
            assign {data_out[i], dest_out[i], is_tail_out[i]} = (PIPELINE_OUTPUT == 0) ?
                {data_out_flit[i], data_out_dest[i], data_out_is_tail[i]} :
                {data_out_reg_flit[i], data_out_reg_dest[i], data_out_reg_is_tail[i]};
        end
    endgenerate

    // grant_input is a combined signal which indicates whether the input
    // has been granted any request. Since an input only requests one output
    // at any cycle, this signal can used to generate the pipeline enable
    always_comb begin
        grant_input = '0;
        for (int i = 0; i < NUM_INPUTS; i++) begin
            for (int j = 0; j < NUM_OUTPUTS; j++) begin
                grant_input[i] = grant_input[i] | grant_mask[j][i];
            end
        end
    end

    // Credit counter
    always_comb begin
        for (int i = 0; i < NUM_OUTPUTS; i++) begin
            credit_counter_in[i] = credit_counter[i] + credit_in[i] - send_out[i];
            credit_counter_plus[i] = credit_counter_in[i] +
                ((PIPELINE_OUTPUT == 1) ? ((flit_out_valid[i] ||
                (data_out_reg_valid[i] && ~send_out[i])) ? 1'b0 : 1'b1) : 1'b0);
        end
    end
    always_ff @(posedge clk) begin
        for (int i = 0; i < NUM_OUTPUTS; i++) begin
            if (rst_n == 1'b0) begin
                credit_counter[i] <= FLIT_BUFFER_DEPTH;
            end else begin
                credit_counter[i] <= credit_counter_in[i];
            end
        end
    end

    // Covert routing table output to one-hot
    always_comb begin
        for (int i = 0; i < NUM_OUTPUTS; i++) begin
            request[i] = '0;
        end
        for (int i = 0; i < NUM_INPUTS; i++) begin
            request[route_table_out[i]][i] = flit_rc_reg_valid[i];
            for (int j = 0; j < NUM_OUTPUTS; j++) begin
                request[j][i] = request[j][i] & ~DISABLE_TURNS[i][j];
            end
        end
    end

    /* Note: This also doesn't change the resource utilization
     * which probably means the logic optimization is being
     * propogated correctly but having an uninteded effect.
     * It's retained for redundancy purposes
     */
    // Grant mask is used to disable selfloop at a second point
    // Just masking the request increased resource utilization
    always_comb begin
        for (int i = 0; i < NUM_OUTPUTS; i++) begin
            grant_mask[i] = grant[i];
        end
        for (int i = 0; i < NUM_INPUTS; i++) begin
            for (int j = 0; j < NUM_OUTPUTS; j++) begin
                grant_mask[j][i] = grant_mask[j][i] & ~DISABLE_TURNS[i][j];
            end
        end
    end

    // Update state of packet receive and transit
    always_ff @(posedge clk) begin
        for (int i = 0; i < NUM_INPUTS; i++) begin
            if (rst_n == 1'b0) begin
                receiving_packet[i] <= 1'b0;
                transiting_packet[i] <= 1'b0;
            end else begin
                receiving_packet[i] <= send_in[i] ? ~is_tail_in[i] : receiving_packet[i];
                if (tail_buffer_valid[i])
                    transiting_packet[i] <= ~tail_buffer_out[i];
                if (tail_buffer_rdreq[i])
                    transiting_packet[i] <= 1'b1;
            end
        end
    end

    // Hold is active when the data is valid until the tail flit
    always_comb begin
        for (int i = 0; i < NUM_OUTPUTS; i++) begin
            hold[i] = '0;
            for (int j = 0; j < NUM_INPUTS; j++) begin
                // If pipeline output is enabled then the data moves forward if
                // the piepline moves forward, which happens when the output
                // is active or the output pipeline register is empty
                hold[i][j] = ~((flit_rc_reg_is_tail[j] & flit_rc_reg_valid[j])
                    && (rc_reg_credit_proxy[j] > (PIPELINE_ARBITER ? 1 : 0)));
            end
        end
    end

    // Flit buffer data and pipeline data valid signal
    always_ff @(posedge clk) begin
        for (int i = 0; i < NUM_INPUTS; i++) begin
            if (rst_n == 1'b0) begin
                tail_buffer_valid[i] <= '0;
            end else begin
                if (rc_pipeline_enable[i])
                    tail_buffer_valid[i] <= 1'b0;
                if (tail_buffer_rdreq[i])
                    tail_buffer_valid[i] <= 1'b1;
            end
        end
    end

    // Output data pipeline
    always_ff @(posedge clk) begin
        for (int i = 0; i < NUM_OUTPUTS; i++) begin
            if (~data_out_reg_valid[i] | send_out[i]) begin
                data_out_reg_flit[i] <= data_out_flit[i];
                data_out_reg_dest[i] <= data_out_dest[i];
                data_out_reg_is_tail[i] <= data_out_is_tail[i];
            end
        end
    end

    // Data out pipeline valid signal
    always_ff @(posedge clk) begin
        for (int i = 0; i < NUM_OUTPUTS; i++) begin
            if (rst_n == 1'b0) begin
                data_out_reg_valid[i] <= '0;
            end else begin
                if (send_out[i])
                    data_out_reg_valid[i] <= 1'b0;

                if (flit_out_valid[i])
                    data_out_reg_valid[i] <= 1'b1;
            end
        end
    end

    // send_out signal
    always_comb begin
        for (int i = 0; i < NUM_OUTPUTS; i++) begin
            if (PIPELINE_OUTPUT == 1)
                send_out[i] = data_out_reg_valid[i] & (credit_counter[i] > 1'b0);
            else
                send_out[i] = flit_out_valid[i] & (credit_counter[i] > 1'b0);
        end
    end

    // Assign flit buffer read request to bypass the pipeline
    always_comb begin
        for (int i = 0; i < NUM_INPUTS; i++) begin
            if (PIPELINE_ARBITER == 1) begin
                flit_buffer_rdreq[i] = sa_pipeline_enable[i] & grant_input[i] & flit_rc_reg_valid[i];
            end else if (PIPELINE_ROUTE_COMPUTE == 1) begin
                flit_buffer_rdreq[i] = rc_pipeline_enable[i] & tail_buffer_valid[i];
            end else begin
                flit_buffer_rdreq[i] = tail_buffer_rdreq[i];
            end
        end
    end

    /**************************************************************************/
    /***************************** Instantiations *****************************/
    /**************************************************************************/

    // Flit buffer FIFOs
    generate
        genvar i;
        for (i = 0; i < NUM_INPUTS; i++) begin: flit_buffer_gen_input
            fifo_agilex7 #(
                .WIDTH      (FLIT_WIDTH),
                .DEPTH      (FLIT_BUFFER_DEPTH),
                .FORCE_MLAB (FORCE_MLAB))
            flit_buffer (
                .clock  (clk),
                .data   (data_in[i]),
                .rdreq  (flit_buffer_rdreq[i]),
                .sclr   (~rst_n),
                .wrreq  (send_in[i]),
                // .empty  (tail_buffer_empty[i]),
                .full   (),                             // Handled with credits
                .q      (flit_buffer_out[i])
            );
        end
    endgenerate

    // Tail buffer FIFOs
    generate
        genvar i;
        for (i = 0; i < NUM_INPUTS; i++) begin: tail_buffer_gen_for_inputs
            fifo_agilex7 #(
                .WIDTH      (1),
                .DEPTH      (FLIT_BUFFER_DEPTH))
                // .FORCE_MLAB (FORCE_MLAB))
            tail_buffer (
                .clock  (clk),
                .data   (is_tail_in[i]),
                .rdreq  (tail_buffer_rdreq[i]),
                .sclr   (~rst_n),
                .wrreq  (send_in[i]),
                .empty  (tail_buffer_empty[i]),
                .full   (),                             // Handled with credits
                .q      (tail_buffer_out[i])
            );
        end
    endgenerate

    // Destination FIFO
    generate
        genvar i;
        for (i = 0; i < NUM_INPUTS; i++) begin: dest_buffer_gen_for_inputs
            fifo_agilex7 #(
                .WIDTH      (DEST_WIDTH),
                .DEPTH      (FLIT_BUFFER_DEPTH),
                .FORCE_MLAB (FORCE_MLAB))
            dest_buffer (
                .clock  (clk),
                .data   (dest_in[i]),
                .rdreq  (dest_buffer_rdreq[i]),
                .sclr   (~rst_n),
                .wrreq  (send_in[i] & ~receiving_packet[i]),
                .empty  (dest_buffer_empty[i]),
                .full   (),                             // Handled with credits
                .q      (dest_buffer_out[i])
            );
        end
    endgenerate

    // Output Arbiters
    generate
        genvar i;
        for (i = 0; i < NUM_OUTPUTS; i++) begin: arbiter_gen_for_outputs
            arbiter_matrix #(
                .NUM_INPUTS(NUM_INPUTS)
            ) arbiter_inst (
                .clk        (clk),
                .rst_n      (rst_n),

                .request    (request[i]),
                .hold       (hold[i]),
                .grant      (grant[i])
            );
        end
    endgenerate

    // Route Compute Pipeline
    generate
        genvar i;
        for (i = 0; i < NUM_INPUTS; i++) begin: route_compute_pipeline_gen_for_inputs
            rc_pipeline #(
                .DATA_WIDTH         (FLIT_WIDTH),
                .DEST_WIDTH         (DEST_WIDTH),
                .NUM_OUTPUTS        (NUM_OUTPUTS),
                .FLIT_BUFFER_DEPTH  (FLIT_BUFFER_DEPTH),
                .ENABLE             (PIPELINE_ROUTE_COMPUTE))
            route_compute_pipeline_inst (
                .clk                (clk),
                .rst_n              (rst_n),

                // .data_in            (flit_buffer_out[i]),
                .dest_in            (dest_buffer_out[i]),
                .is_tail_in         (tail_buffer_out[i]),
                .route_in           (route_table[route_table_select[i]]),
                .credit_count_in    (credit_counter_plus),
                .valid_in           (tail_buffer_valid[i]),
                .enable_out         (rc_pipeline_enable[i]),

                // .data_out           (flit_rc_reg_flit[i]),
                .dest_out           (flit_rc_reg_dest[i]),
                .is_tail_out        (flit_rc_reg_is_tail[i]),
                .credit_count_out   (rc_reg_credit_proxy[i]),
                .valid_out          (flit_rc_reg_valid[i]),
                .route_out          (route_table_out[i]),
                .enable_in          (sa_pipeline_enable[i])
            );
        end
    endgenerate

    // Arbiter Pipeline
    logic [NUM_OUTPUTS - 1 : 0] grant_pipeline_in [NUM_INPUTS];
    logic [NUM_OUTPUTS - 1 : 0] grant_pipeline_out[NUM_INPUTS];
    logic [NUM_OUTPUTS - 1 : 0] output_stalled;

    always_comb begin
        for (int i = 0; i < NUM_INPUTS; i++) begin
            for (int j = 0; j < NUM_OUTPUTS; j++) begin
                grant_pipeline_in[i][j] = grant_mask[j][i];
                grant_reg[j][i] = grant_pipeline_out[i][j];
            end
        end
    end

    generate
        genvar i;
        for (i = 0; i < NUM_INPUTS; i++) begin: arbiter_pipeline_gen_for_inputs
            sa_pipeline #(
                .DATA_WIDTH         (FLIT_WIDTH),
                .DEST_WIDTH         (DEST_WIDTH),
                .NUM_OUTPUTS        (NUM_OUTPUTS),
                .FLIT_BUFFER_DEPTH  (FLIT_BUFFER_DEPTH),
                .ENABLE             (PIPELINE_ARBITER))
            arbiter_pipeline_inst (
                .clk                (clk),
                .rst_n              (rst_n),

                .grant              (grant_input[i]),

                // .data_in            (flit_rc_reg_flit[i]),
                .dest_in            (flit_rc_reg_dest[i]),
                .is_tail_in         (flit_rc_reg_is_tail[i]),
                .grant_in           (grant_pipeline_in[i]),
                .route_in           (route_table_out[i]),
                .valid_in           (flit_rc_reg_valid[i]),

                // .data_out           (flit_sa_reg_flit[i]),
                .dest_out           (flit_sa_reg_dest[i]),
                .is_tail_out        (flit_sa_reg_is_tail[i]),
                .grant_out          (grant_pipeline_out[i]),
                .route_out          (route_sa_reg[i]),
                .valid_out          (flit_sa_reg_valid[i]),
                .enable_in          (sa_pipeline_enable[i])
            );
        end
    endgenerate

    // Crossbar
    always_comb begin
        for (int i = 0; i < NUM_INPUTS; i++) begin
            // Directly connect the data FIFO into the crossbar
            flit_sa_reg[i] = {flit_buffer_out[i], flit_sa_reg_dest[i], flit_sa_reg_is_tail[i]};
        end

        for (int i = 0; i < NUM_OUTPUTS; i++) begin
            {data_out_flit[i], data_out_dest[i], data_out_is_tail[i]} = data_out_packed[i];
        end
    end

    crossbar_onehot #(
        .DATA_WIDTH         (FLIT_WIDTH + DEST_WIDTH + 1),
        .NUM_INPUTS         (NUM_INPUTS),
        .NUM_OUTPUTS        (NUM_OUTPUTS))
    crossbar_inst (
        .data_in     (flit_sa_reg),
        .valid_in    (flit_sa_reg_valid),

        .data_out    (data_out_packed),
        .valid_out   (flit_out_valid),

        .select      (grant_reg)
    );

endmodule: router

module arbiter_matrix #(
    parameter NUM_INPUTS = 4
) (
    input   wire                            clk,
    input   wire                            rst_n,

    input   wire    [NUM_INPUTS - 1 : 0]    request,
    input   wire    [NUM_INPUTS - 1 : 0]    hold,
    output  logic   [NUM_INPUTS - 1 : 0]    grant
);
    logic matrix [NUM_INPUTS][NUM_INPUTS];

    // Hold input is expected to high from when the request is made
    // till before the last cycle of the required grant but to keep
    // the grants stable during a hold, we need to latch the grants
    // after the first cycle of the hold and keep them stable till
    // after the last cycle of the hold while the new grant is generated
    // This is done by using a delay on the hold signal which is used to
    // combinationally affect the grant and hold circuit
    logic [NUM_INPUTS - 1 : 0] hold_delay;
    logic anyhold;
    logic [NUM_INPUTS - 1 : 0] grant_int, grant_prev;

    logic deactivate [NUM_INPUTS];

    // Generate instantaneous grant logic combinationally
    always_comb begin
        for (int i = 0; i < NUM_INPUTS; i++) begin
            grant_int[i] = request[i] & ~deactivate[i];
        end
    end

    // Latch grant and hold logic
    always_ff @(posedge clk) begin
        // This should not depend on request since request is only dependent on
        // data being valid but hold must act to hold the request for when it is
        // low. Hold is later gated by whether grant is high or not which
        // accounts for the case when the request is low to start and the
        // request has not been granted yet so as to not hold a no-grant
        hold_delay <= hold;
        if (rst_n == 1'b0) begin
            grant_prev <= '0;
        end else begin
            grant_prev <= grant;
        end
    end

    // Generate anyhold signal
    always_comb begin
        anyhold = 1'b0;
        for (int i = 0; i < NUM_INPUTS; i++) begin
            anyhold = anyhold | (hold_delay[i] & grant_prev[i]);
        end
    end

    // Generate grant logic
    always_comb begin
        for (int i = 0; i < NUM_INPUTS; i++) begin
            grant[i] = (hold_delay[i] & grant_prev[i]) ? grant_prev[i] : (grant_int[i] & ~anyhold);
        end
    end

    // Generate deactivate signals
    always_comb begin
        for (int i = 0; i < NUM_INPUTS; i++) begin
            deactivate[i] = 1'b0;
            for (int j = 0; j < NUM_INPUTS; j++) begin
                deactivate[i] = deactivate[i] | (matrix[j][i] & request[j]);
            end
        end
    end

    // Matrix update logic
    always_ff @(posedge clk) begin
        if (rst_n == 1'b0) begin
            for (int i = 0; i < NUM_INPUTS; i++) begin
                for (int j = i + 1; j < NUM_INPUTS; j++) begin
                    matrix[i][j] <= 1'b1;
                    matrix[j][i] <= 1'b0;
                end
            end
            for (int i = 0; i < NUM_INPUTS; i++) begin
                matrix[i][i] <= 1'b0;
            end
        end else begin
            // Matrix can always be updated because grants are held with holds
            for (int i = 1; i < NUM_INPUTS; i++) begin
                for (int j = 0; j < i; j++) begin
                    matrix[i][j] <= (matrix[i][j] & ~grant[i]) | grant[j];
                    matrix[j][i] <= (matrix[j][i] & ~grant[j]) | grant[i];
                end
            end
        end
    end

endmodule: arbiter_matrix

module onehot_to_binary #(
    parameter WIDTH = 4
) (
    input   wire    [WIDTH - 1 : 0]         onehot,
    output  logic   [$clog2(WIDTH) - 1 : 0] binary
);
    always_comb begin
        binary = '0;
        for (int i = 0; i < WIDTH; i++) begin
            binary |= onehot[i] ? i : '0;
        end
    end
endmodule: onehot_to_binary

module crossbar_onehot #(
    parameter DATA_WIDTH = 32,
    parameter NUM_INPUTS = 2,
    parameter NUM_OUTPUTS = 2,
    parameter MODE = "ONEHOT"       // BINARY, ONEHOT, EXPLICIT (supports upto 5x5)
) (
    input   wire    [0:NUM_INPUTS-1][DATA_WIDTH - 1 : 0]    data_in    ,
    input   wire    [0:NUM_INPUTS-1]                        valid_in   ,

    output  logic   [0:NUM_OUTPUTS-1][DATA_WIDTH - 1 : 0]    data_out    ,
    output  logic   [0:NUM_OUTPUTS-1]                        valid_out   ,
    input   wire    [0:NUM_OUTPUTS-1][NUM_INPUTS - 1 : 0]    select      
);

    generate
        if (MODE == "BINARY") begin
            logic [$clog2(NUM_INPUTS) - 1 : 0] select_binary [NUM_OUTPUTS];
            genvar i;
            for (i = 0; i < NUM_OUTPUTS; i++) begin: crossbar_for_outputs
                onehot_to_binary #(
                    .WIDTH (NUM_INPUTS)
                ) onehot_to_binary_inst (
                    .onehot (select[i]),
                    .binary (select_binary[i])
                );

                assign data_out[i] = ((select[i] == '0) || data_in[select_binary[i]]);
                assign valid_out[i] = (select[i] == '0) ? 1'b0 : valid_in[select_binary[i]];
            end
        end else if (MODE == "ONEHOT") begin
            always_comb begin
                for (int i = 0; i < NUM_OUTPUTS; i++) begin
                    data_out[i] = '0;
                    valid_out[i] = '0;
                    for (int j = 0; j < NUM_INPUTS; j++) begin
                        if (select[i][j]) begin
                            data_out[i] |= data_in[j];
                            valid_out[i] |= valid_in[j];
                        end
                    end
                end
            end
        end else if (MODE == "EXPLICIT") begin
            logic [4 : 0] select_expanded [NUM_OUTPUTS];

            logic [DATA_WIDTH - 1 : 0] data_in_expanded[5];
            logic valid_in_expanded[5];

            genvar i;
            for (i = 0; i < NUM_INPUTS; i++) begin: for_inputs
                assign data_in_expanded[i] = data_in[i];
                assign valid_in_expanded[i] = valid_in[i];
            end

            for (i = 0; i < NUM_OUTPUTS; i++) begin: for_outputs
                assign select_expanded[i] = {'0, select[i]};

                always_comb begin
                    data_out[i] = 'x;
                    valid_out[i] = 'x;
                    case (select_expanded[i])
                        5'b00000: begin
                            data_out[i] = 'x;
                            valid_out[i] = '0;
                        end
                        5'b00001: begin
                            data_out[i] = data_in_expanded[0];
                            valid_out[i] = valid_in_expanded[0];
                        end
                        5'b00010: begin
                            data_out[i] = data_in_expanded[1];
                            valid_out[i] = valid_in_expanded[1];
                        end
                        5'b00100: begin
                            data_out[i] = data_in_expanded[2];
                            valid_out[i] = valid_in_expanded[2];
                        end
                        5'b01000: begin
                            data_out[i] = data_in_expanded[3];
                            valid_out[i] = valid_in_expanded[3];
                        end
                        5'b10000: begin
                            data_out[i] = data_in_expanded[4];
                            valid_out[i] = valid_in_expanded[4];
                        end
                        default: begin
                            data_out[i] = 'x;
                            valid_out[i] = 1'bx;
                        end
                    endcase
                end
            end
        end
    endgenerate

endmodule: crossbar_onehot

module rc_pipeline #(
    parameter DATA_WIDTH = 32,
    parameter DEST_WIDTH = 4,
    parameter NUM_OUTPUTS = 2,
    parameter FLIT_BUFFER_DEPTH = 2,
    parameter bit ENABLE = 1
) (
    input wire clk,
    input wire rst_n,

    // input   wire    [DATA_WIDTH - 1 : 0]                    data_in,
    input   wire    [DEST_WIDTH - 1 : 0]                    dest_in,
    input   wire                                            is_tail_in,
    input   wire    [$clog2(NUM_OUTPUTS) - 1 : 0]           route_in,
    input   wire    [0:NUM_OUTPUTS-1][$clog2(FLIT_BUFFER_DEPTH + 2) - 1 : 0] credit_count_in,
    input   wire                                            valid_in,
    output  logic                                           enable_out,

    // output  logic   [DATA_WIDTH - 1 : 0]                    data_out,
    output  logic   [DEST_WIDTH - 1 : 0]                    dest_out,
    output  logic                                           is_tail_out,
    output  logic   [$clog2(NUM_OUTPUTS) - 1 : 0]           route_out,
    output  logic   [$clog2(FLIT_BUFFER_DEPTH + 2) - 1: 0]  credit_count_out,
    output  logic                                           valid_out,
    input   wire                                            enable_in
);

    generate 
        if (ENABLE == 1) begin
            always_ff @(posedge clk) begin
                if (rst_n == 1'b0) begin
                    valid_out <= '0;
                end else begin
                    if (enable_in) valid_out <= 1'b0;
                    if (valid_in) valid_out <= 1'b1;
                end

                if (~valid_out | enable_in) begin
                    // data_out <= data_in;
                    dest_out <= dest_in;
                    is_tail_out <= is_tail_in;
                    route_out <= route_in;
                    credit_count_out <= credit_count_in[route_in];
                end else begin
                    credit_count_out <= credit_count_in[route_out];
                end
            end
            assign enable_out = enable_in | ~valid_out;
        end else if (ENABLE == 0) begin
            // assign data_out = data_in;
            assign dest_out = dest_in;
            assign is_tail_out = is_tail_in;
            assign route_out = route_in;
            assign valid_out = valid_in;
            assign credit_count_out = credit_count_in[route_in];

            assign enable_out = enable_in;
        end
    endgenerate

endmodule: rc_pipeline

module sa_pipeline #(
    parameter DATA_WIDTH = 32,
    parameter DEST_WIDTH = 4,
    parameter NUM_OUTPUTS = 2,
    parameter FLIT_BUFFER_DEPTH = 2,
    parameter bit ENABLE = 1
) (
    input   wire    clk,
    input   wire    rst_n,

    input   wire                                            grant,

    // input   wire    [DATA_WIDTH - 1 : 0]                    data_in,
    input   wire    [DEST_WIDTH - 1 : 0]                    dest_in,
    input   wire                                            is_tail_in,
    input   wire    [NUM_OUTPUTS - 1 : 0]                   grant_in,
    input   wire    [$clog2(NUM_OUTPUTS) - 1 : 0]           route_in,
    input   wire                                            valid_in,

    // output  logic   [DATA_WIDTH - 1 : 0]                    data_out,
    output  logic   [DEST_WIDTH - 1 : 0]                    dest_out,
    output  logic                                           is_tail_out,
    output  logic   [NUM_OUTPUTS - 1 : 0]                   grant_out,
    output  logic   [$clog2(NUM_OUTPUTS) - 1 : 0]           route_out,
    output  logic                                           valid_out,

    input   wire                                            enable_in
);
    logic [NUM_OUTPUTS - 1 : 0] grant_reg;

    generate
        if (ENABLE == 1) begin
            always_ff @(posedge clk) begin
                if (rst_n == 1'b0) begin
                    valid_out <= '0;
                end else begin
                    if (valid_in & grant & enable_in) valid_out <= 1'b1;
                    else valid_out <= 1'b0;
                end

                if (enable_in) begin
                    // data_out <= data_in;
                    dest_out <= dest_in;
                    is_tail_out <= is_tail_in;
                    grant_reg <= grant_in;
                    route_out <= route_in;
                end
            end
            assign grant_out = valid_out ? grant_reg : '0;
        end else if (ENABLE == 0) begin
            // assign data_out = data_in;
            assign dest_out = dest_in;
            assign is_tail_out = is_tail_in;
            assign grant_out = grant_in;
            assign route_out = route_in;
            assign valid_out = valid_in;
        end
    endgenerate

endmodule: sa_pipeline
