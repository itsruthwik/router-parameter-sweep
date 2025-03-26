module dcfifo_mixed_widths #(
    parameter lpm_width = 512,               // Write side data width
    parameter lpm_width_r = 128,             // Read side data width
    parameter lpm_numwords = 8,              // FIFO depth (in write-width words)
    parameter lpm_showahead = "OFF",         // Show-ahead mode ("ON"/"OFF")
    parameter lpm_widthu = 4,                // Write-side address width 
    parameter lpm_widthu_r = 6,              // Read-side address width
    parameter add_usedw_msb_bit = "ON",      // Add MSB to used words counters
    parameter overflow_checking = "OFF",      // Check for overflow
    parameter underflow_checking = "OFF",     // Check for underflow
    parameter use_eab = "ON",                // Use embedded memory
    parameter write_aclr_synch = "ON",       // Synchronize write-side reset
    parameter read_aclr_synch = "ON",        // Synchronize read-side reset
    parameter enable_ecc = "FALSE",          // Enable ECC
    parameter intended_device_family = "Agilex 7",  // Target device family
    parameter wrsync_delaypipe = 4,          // Write clock domain sync stages
    parameter rdsync_delaypipe = 4,          // Read clock domain sync stages
    parameter lpm_hint = "UNUSED",           // Device-specific optimization
    parameter lpm_type = "dcfifo_mixed_widths" // Library of parameterized modules type
) (
    input  wire                   aclr,       // Asynchronous clear
    input  wire [lpm_width-1:0]   data,       // Input data (write width)
    input  wire                   rdclk,      // Read clock
    input  wire                   rdreq,      // Read request
    input  wire                   wrclk,      // Write clock
    input  wire                   wrreq,      // Write request
    output wire [lpm_width_r-1:0] q,          // Output data (read width)
    output wire                   rdempty,    // Read empty flag
    output wire                   wrfull,     // Write full flag
    output wire                   wrempty,    // Write empty flag
    output wire                   rdfull,     // Read full flag
    output wire [lpm_widthu-1:0]  wrusedw,    // Write used words
    output wire [lpm_widthu_r-1:0] rdusedw,   // Read used words
    output wire [1:0]             eccstatus   // ECC status
);
    // Calculate bits per entry in each domain
    localparam BITS_IN_FIFO = lpm_numwords * lpm_width;
    localparam RD_WORDS = BITS_IN_FIFO / lpm_width_r;
    localparam WR_ADDR_WIDTH = $clog2(lpm_numwords);
    localparam RD_ADDR_WIDTH = $clog2(RD_WORDS);
    
    // Memory declaration
    reg [lpm_width-1:0] fifo_mem [0:lpm_numwords-1];
    
    // Pointers for write domain (in write words)
    reg [WR_ADDR_WIDTH:0] wr_ptr_bin;
    reg [WR_ADDR_WIDTH:0] wr_ptr_gray;
    
    // Pointers for read domain (in read words)
    reg [RD_ADDR_WIDTH:0] rd_ptr_bin;
    reg [RD_ADDR_WIDTH:0] rd_ptr_gray;
    
    // Synchronization registers
    reg [WR_ADDR_WIDTH:0] wr_ptr_gray_sync [rdsync_delaypipe-1:0];
    reg [RD_ADDR_WIDTH:0] rd_ptr_gray_sync [wrsync_delaypipe-1:0];
    
    // Reset synchronization registers
    reg rd_reset_sync1, rd_reset_sync2;
    reg wr_reset_sync1, wr_reset_sync2;
    wire rd_reset = aclr | rd_reset_sync2;  // Synthesis-friendly combined reset
    wire wr_reset = aclr | wr_reset_sync2;  // Synthesis-friendly combined reset
    
    // Output registers for read side
    reg [lpm_width_r-1:0] q_reg;
    
    // Function declarations (same as before)
    function automatic [WR_ADDR_WIDTH:0] wr_bin2gray(input [WR_ADDR_WIDTH:0] bin);
        wr_bin2gray = bin ^ (bin >> 1);
    endfunction
    
    function automatic [RD_ADDR_WIDTH:0] rd_bin2gray(input [RD_ADDR_WIDTH:0] bin);
        rd_bin2gray = bin ^ (bin >> 1);
    endfunction
    
    function automatic [WR_ADDR_WIDTH:0] wr_gray2bin(input [WR_ADDR_WIDTH:0] gray);
        integer i;
        reg [WR_ADDR_WIDTH:0] bin;
        begin
            bin = gray;
            for (i = 1; i <= WR_ADDR_WIDTH; i = i + 1)
                bin = bin ^ (gray >> i);
            wr_gray2bin = bin;
        end
    endfunction
    
    function automatic [RD_ADDR_WIDTH:0] rd_gray2bin(input [RD_ADDR_WIDTH:0] gray);
        integer i;
        reg [RD_ADDR_WIDTH:0] bin;
        begin
            bin = gray;
            for (i = 1; i <= RD_ADDR_WIDTH; i = i + 1)
                bin = bin ^ (gray >> i);
            rd_gray2bin = bin;
        end
    endfunction
    
    // Domain conversion functions
    function automatic [RD_ADDR_WIDTH:0] wr_to_rd_ptr(input [WR_ADDR_WIDTH:0] wr_ptr);
        wr_to_rd_ptr = wr_ptr * lpm_width / lpm_width_r;
    endfunction
    
    function automatic [WR_ADDR_WIDTH:0] rd_to_wr_ptr(input [RD_ADDR_WIDTH:0] rd_ptr);
        rd_to_wr_ptr = rd_ptr * lpm_width_r / lpm_width;
    endfunction
    
    // Reset synchronization - separated for synthesis
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
    
    // Write pointer management - using simplified reset
    always @(posedge wrclk or posedge wr_reset) begin
        if (wr_reset) begin
            wr_ptr_bin <= 0;
            wr_ptr_gray <= 0;
        end else begin
            if (wrreq && !wrfull) begin
                // Store data in memory
                fifo_mem[wr_ptr_bin[WR_ADDR_WIDTH-1:0]] <= data;
                
                // Update write pointer
                wr_ptr_bin <= wr_ptr_bin + 1'b1;
                wr_ptr_gray <= wr_bin2gray(wr_ptr_bin + 1'b1);
            end
        end
    end
    
    // Read pointer management - using simplified reset
    always @(posedge rdclk or posedge rd_reset) begin
        if (rd_reset) begin
            rd_ptr_bin <= 0;
            rd_ptr_gray <= 0;
        end else begin
            if (rdreq && !rdempty) begin
                // Update read pointer
                rd_ptr_bin <= rd_ptr_bin + 1'b1;
                rd_ptr_gray <= rd_bin2gray(rd_ptr_bin + 1'b1);
            end
        end
    end
    
    // Synchronize write pointer to read domain - using simplified reset
    integer i;
    always @(posedge rdclk or posedge rd_reset) begin
        if (rd_reset) begin
            for (i = 0; i < rdsync_delaypipe; i = i + 1)
                wr_ptr_gray_sync[i] <= 0;
        end else begin
            wr_ptr_gray_sync[0] <= wr_ptr_gray;
            for (i = 1; i < rdsync_delaypipe; i = i + 1)
                wr_ptr_gray_sync[i] <= wr_ptr_gray_sync[i-1];
        end
    end
    
    // Synchronize read pointer to write domain - using simplified reset
    integer j;
    always @(posedge wrclk or posedge wr_reset) begin
        if (wr_reset) begin
            for (j = 0; j < wrsync_delaypipe; j = j + 1)
                rd_ptr_gray_sync[j] <= 0;
        end else begin
            rd_ptr_gray_sync[0] <= rd_ptr_gray;
            for (j = 1; j < wrsync_delaypipe; j = j + 1)
                rd_ptr_gray_sync[j] <= rd_ptr_gray_sync[j-1];
        end
    end
    
    // Convert synchronized gray-code pointers to binary
    wire [WR_ADDR_WIDTH:0] wr_ptr_bin_rd_domain = wr_gray2bin(wr_ptr_gray_sync[rdsync_delaypipe-1]);
    wire [RD_ADDR_WIDTH:0] rd_ptr_bin_wr_domain = rd_gray2bin(rd_ptr_gray_sync[wrsync_delaypipe-1]);
    
    // Generate status flags
    wire [RD_ADDR_WIDTH:0] wr_ptr_rd = wr_to_rd_ptr(wr_ptr_bin_rd_domain);
    wire [WR_ADDR_WIDTH:0] rd_ptr_wr = rd_to_wr_ptr(rd_ptr_bin_wr_domain);
    
    assign rdempty = (rd_ptr_bin == wr_ptr_rd);
    assign wrfull = ((wr_ptr_bin[WR_ADDR_WIDTH-1:0] == rd_ptr_wr[WR_ADDR_WIDTH-1:0]) && 
                    (wr_ptr_bin[WR_ADDR_WIDTH] != rd_ptr_wr[WR_ADDR_WIDTH]));
    
    // Additional status signals
    assign wrempty = (wr_ptr_bin == rd_ptr_wr);
    assign rdfull = ((rd_ptr_bin[RD_ADDR_WIDTH-1:0] == wr_ptr_rd[RD_ADDR_WIDTH-1:0]) && 
                    (rd_ptr_bin[RD_ADDR_WIDTH] != wr_ptr_rd[RD_ADDR_WIDTH]));
    
    // Used words calculation
    assign wrusedw = wr_ptr_bin - rd_ptr_wr;
    assign rdusedw = wr_ptr_rd - rd_ptr_bin;
    
    // Output data registers
    reg [lpm_width-1:0] wide_data;
    reg [WR_ADDR_WIDTH:0] wr_addr_temp;
    reg [31:0] start_bit;
    
    // Data shifting and output logic - use separate blocks with proper events
    always @(posedge rdclk or posedge rd_reset) begin
        if (rd_reset) begin
            q_reg <= 0;
            wide_data <= 0;
            wr_addr_temp <= 0;
            start_bit <= 0;
        end else begin
            if (lpm_showahead == "ON") begin
                if (!rdempty) begin
                    // For show-ahead mode
                    wr_addr_temp <= rd_to_wr_ptr(rd_ptr_bin);
                    wide_data <= fifo_mem[wr_addr_temp[WR_ADDR_WIDTH-1:0]];
                    start_bit <= (rd_ptr_bin % (lpm_width/lpm_width_r)) * lpm_width_r;
                    // Use a mask and shift approach for bit selection
                    q_reg <= (wide_data >> start_bit) & ((1 << lpm_width_r) - 1);
                end
            end else if (rdreq && !rdempty) begin
                // For normal mode
                wr_addr_temp <= rd_to_wr_ptr(rd_ptr_bin);
                wide_data <= fifo_mem[wr_addr_temp[WR_ADDR_WIDTH-1:0]];
                start_bit <= (rd_ptr_bin % (lpm_width/lpm_width_r)) * lpm_width_r;
                // Use a mask and shift approach for bit selection
                q_reg <= (wide_data >> start_bit) & ((1 << lpm_width_r) - 1);
            end
        end
    end
    
    // Output assignments
    assign q = q_reg;
    assign eccstatus = 2'b00; // No ECC errors by default
endmodule