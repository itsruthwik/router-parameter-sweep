module dcfifo #(
    parameter WIDTH = 512,
    parameter DEPTH = 8,
    parameter EXTRA_SYNC_STAGES = 0,
    parameter SHOWAHEAD = "OFF",
    parameter bit FORCE_MLAB = 0  // Ignored in generic implementation
) (
    input  wire                   aclr,
    input  wire [WIDTH-1:0]       data,
    input  wire                   rdclk,
    input  wire                   rdreq,
    input  wire                   wrclk,
    input  wire                   wrreq,
    output wire [WIDTH-1:0]       q,
    output wire                   rdempty,
    output wire                   wrfull,
    output wire [$clog2(DEPTH):0] wrusedw
);
    // Internal parameters
    localparam ADDR_WIDTH = $clog2(DEPTH);
    localparam PTR_WIDTH = ADDR_WIDTH + 1;  // Extra bit for wrap detection
    localparam SYNC_STAGES = 2 + EXTRA_SYNC_STAGES;
    
    // Memory for data storage
    reg [WIDTH-1:0] mem [0:DEPTH-1];
    
    // Pointers for read/write (binary and gray-coded)
    reg [PTR_WIDTH-1:0] wr_ptr_bin;
    reg [PTR_WIDTH-1:0] rd_ptr_bin;
    reg [PTR_WIDTH-1:0] wr_ptr_gray;
    reg [PTR_WIDTH-1:0] rd_ptr_gray;
    
    // Synchronized pointers
    reg [PTR_WIDTH-1:0] wr_ptr_gray_sync [SYNC_STAGES-1:0];
    reg [PTR_WIDTH-1:0] rd_ptr_gray_sync [SYNC_STAGES-1:0];
    
    // Reset synchronizers
    reg rd_reset_sync1;
    reg rd_reset_sync2;
    reg wr_reset_sync1;
    reg wr_reset_sync2;
    
    // Combined reset signals for synthesis
    wire rd_reset;
    wire wr_reset;
     // Flag condition signals
    wire empty_condition;
    wire full_condition;

    
    // Output registers
    reg [WIDTH-1:0] q_reg;
    reg [PTR_WIDTH-1:0] rd_ptr_bin_sync_wr_domain;
    
    // Binary to Gray conversion
    function automatic [PTR_WIDTH-1:0] bin2gray(input [PTR_WIDTH-1:0] bin);
        bin2gray = bin ^ (bin >> 1);
    endfunction
    
    // Gray to Binary conversion
    function automatic [PTR_WIDTH-1:0] gray2bin(input [PTR_WIDTH-1:0] gray);
        integer i;
        reg [PTR_WIDTH-1:0] binary;
        begin
            binary = gray;
            for (i = 1; i < PTR_WIDTH; i = i + 1)
                binary = binary ^ (gray >> i);
            gray2bin = binary;
        end
    endfunction
    
    // Generate combined reset signals
    assign rd_reset = aclr;
    assign wr_reset = aclr;
    
    // Reset synchronizer for read domain - each FF in a separate always block
    always @(posedge rdclk or posedge aclr) begin
        if (aclr) begin
            rd_reset_sync1 <= 1'b1;
        end else begin
            rd_reset_sync1 <= 1'b0;
        end
    end
    
    always @(posedge rdclk or posedge aclr) begin
        if (aclr) begin
            rd_reset_sync2 <= 1'b1;
        end else begin
            rd_reset_sync2 <= rd_reset_sync1;
        end
    end
    
    // Reset synchronizer for write domain - each FF in a separate always block
    always @(posedge wrclk or posedge aclr) begin
        if (aclr) begin
            wr_reset_sync1 <= 1'b1;
        end else begin
            wr_reset_sync1 <= 1'b0;
        end
    end
    
    always @(posedge wrclk or posedge aclr) begin
        if (aclr) begin
            wr_reset_sync2 <= 1'b1;
        end else begin
            wr_reset_sync2 <= wr_reset_sync1;
        end
    end
    
    // Write pointer logic - using only aclr in sensitivity list
    always @(posedge wrclk or posedge aclr) begin
        if (aclr) begin
            wr_ptr_bin <= 0;
            wr_ptr_gray <= 0;
        end else begin
            if (wr_reset_sync2) begin  // Check in if-else, not sensitivity list
                wr_ptr_bin <= 0;
                wr_ptr_gray <= 0;
            end else if (wrreq && !wrfull) begin
                mem[wr_ptr_bin[ADDR_WIDTH-1:0]] <= data;
                wr_ptr_bin <= wr_ptr_bin + 1'b1;
                wr_ptr_gray <= bin2gray(wr_ptr_bin + 1'b1);
            end
        end
    end
    
    // Read pointer logic - using only aclr in sensitivity list
    always @(posedge rdclk or posedge aclr) begin
        if (aclr) begin
            rd_ptr_bin <= 0;
            rd_ptr_gray <= 0;
            if (SHOWAHEAD == "ON")
                q_reg <= {WIDTH{1'b0}};
        end else begin
            if (rd_reset_sync2) begin  // Check in if-else, not sensitivity list
                rd_ptr_bin <= 0;
                rd_ptr_gray <= 0;
                if (SHOWAHEAD == "ON")
                    q_reg <= {WIDTH{1'b0}};
            end else if (rdreq && !rdempty) begin
                rd_ptr_bin <= rd_ptr_bin + 1'b1;
                rd_ptr_gray <= bin2gray(rd_ptr_bin + 1'b1);
                
                if (SHOWAHEAD == "ON" && rd_ptr_bin[ADDR_WIDTH-1:0] + 1'b1 < DEPTH)
                    q_reg <= mem[rd_ptr_bin[ADDR_WIDTH-1:0] + 1'b1];
                else
                    q_reg <= mem[rd_ptr_bin[ADDR_WIDTH-1:0]];
            end else if (SHOWAHEAD == "ON" && !rdempty) begin
                q_reg <= mem[rd_ptr_bin[ADDR_WIDTH-1:0]];
            end
        end
    end
    
    // Synchronize write pointer to read domain
    integer i;
    always @(posedge rdclk or posedge aclr) begin
        if (aclr) begin
            for (i = 0; i < SYNC_STAGES; i = i + 1)
                wr_ptr_gray_sync[i] <= 0;
        end else begin
            wr_ptr_gray_sync[0] <= wr_ptr_gray;
            for (i = 1; i < SYNC_STAGES; i = i + 1)
                wr_ptr_gray_sync[i] <= wr_ptr_gray_sync[i-1];
        end
    end
    
    // Synchronize read pointer to write domain
    integer j;
    always @(posedge wrclk or posedge aclr) begin
        if (aclr) begin
            for (j = 0; j < SYNC_STAGES; j = j + 1)
                rd_ptr_gray_sync[j] <= 0;
        end else begin
            rd_ptr_gray_sync[0] <= rd_ptr_gray;
            for (j = 1; j < SYNC_STAGES; j = j + 1)
                rd_ptr_gray_sync[j] <= rd_ptr_gray_sync[j-1];
        end
    end
    
    // Flag generation 
    assign empty_condition = (rd_ptr_gray == wr_ptr_gray_sync[SYNC_STAGES-1]);
    assign full_condition = (wr_ptr_gray[PTR_WIDTH-1] != rd_ptr_gray_sync[SYNC_STAGES-1][PTR_WIDTH-1]) &&
                           (wr_ptr_gray[PTR_WIDTH-2:0] == rd_ptr_gray_sync[SYNC_STAGES-1][PTR_WIDTH-2:0]);
    // Convert synchronized rd_ptr_gray to binary for wrusedw calculation
    always @(posedge wrclk or posedge aclr) begin
        if (aclr)
            rd_ptr_bin_sync_wr_domain <= 0;
        else
            rd_ptr_bin_sync_wr_domain <= gray2bin(rd_ptr_gray_sync[SYNC_STAGES-1]);
    end
    

    
    // Output assignments
    assign rdempty = empty_condition;
    assign wrfull = full_condition;
    assign wrusedw = wr_ptr_bin - rd_ptr_bin_sync_wr_domain;
    
    // Output mux based on mode
    reg [WIDTH-1:0] q_int;
    always @(*) begin
        if (SHOWAHEAD == "ON")
            q_int = q_reg;
        else if (rdreq && !rdempty)
            q_int = mem[rd_ptr_bin[ADDR_WIDTH-1:0]];
        else
            q_int = q_reg;
    end
    
    assign q = q_int;
    
endmodule