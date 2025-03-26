module routing_table #(
    parameter NUM_ROWS = 2,  
    parameter NUM_COLS = 2,  
    // parameter NUM_OUTPUTS = 5, 
    parameter ROUTE_WIDTH = 4,  //$clog2(NUM_OUTPUTS), // each line in rtr table = port number
    parameter RTR_ADDR_WIDTH = $clog2(NUM_ROWS * NUM_COLS)
)(
    input  [RTR_ADDR_WIDTH - 1 : 0] router_address,  // {roi_id, col_id}
    // output logic [ROUTE_WIDTH - 1 : 0] routing_table [(NUM_ROWS * NUM_COLS) - 1:0] 
    output logic [0: (NUM_ROWS * NUM_COLS)-1][ROUTE_WIDTH - 1 : 0]  routing_table

);

    integer i, j;

    // should we only support mesh that has same ows & cols??
    localparam ROW_WIDTH = $clog2(NUM_ROWS);
    localparam COL_WIDTH = $clog2(NUM_COLS);

    logic [ROW_WIDTH- 1 : 0] row_id;
    logic [COL_WIDTH- 1 : 0] col_id;

        //  router_address,  // {roi_id, col_id}
    assign row_id = router_address[RTR_ADDR_WIDTH-1 : COL_WIDTH]; 
    assign col_id = router_address[COL_WIDTH-1 : 0];

    function logic [ROUTE_WIDTH - 1 : 0] calculate_port;
        input [31:0] num_rows, num_cols, row_id, col_id;
        input [2:0] dir; // N 0; S 1 ; E 2; W 3
        begin
            case (dir)
                0: calculate_port = 1; // n
                1: calculate_port = (row_id != num_rows - 1) ? 2 : 1; // s
                2: calculate_port = (col_id != num_cols - 1) ? 3 : 1; // e
                3: calculate_port = (col_id != 0) ? 4 : 1; // w
                default: calculate_port = 0;
            endcase
        end
    endfunction

    // Generate the routing table
    always @(*) begin
        for (i = 0; i < NUM_ROWS; i = i + 1) begin
            for (j = 0; j < NUM_COLS; j = j + 1) begin
                if (j == col_id) begin
                    if (i == row_id) begin
                        routing_table[i * NUM_COLS + j] = 0; // self
                    end else if (i < row_id) begin
                        routing_table[i * NUM_COLS + j] = calculate_port(NUM_ROWS, NUM_COLS, row_id, col_id, 0); // n
                    end else begin
                        routing_table[i * NUM_COLS + j] = calculate_port(NUM_ROWS, NUM_COLS, row_id, col_id, 1); // s
                    end
                end else if (j < col_id) begin
                    routing_table[i * NUM_COLS + j] = calculate_port(NUM_ROWS, NUM_COLS, row_id, col_id, 3); // w
                end else begin
                    routing_table[i * NUM_COLS + j] = calculate_port(NUM_ROWS, NUM_COLS, row_id, col_id, 2); // e
                end
            end
        end
    end

endmodule