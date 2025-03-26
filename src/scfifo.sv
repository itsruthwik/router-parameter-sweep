module scfifo #(
    parameter lpm_width = 32,              // Data width
    parameter lpm_numwords = 4,            // FIFO depth
    parameter lpm_showahead = "OFF",       // Read mode: "OFF" = normal, "ON" = show-ahead
    parameter add_ram_output_register = "ON", // Add output register
    parameter enable_ecc = "FALSE",        // Enable ECC
    parameter intended_device_family = "Agilex 7", // Target device family
    parameter lpm_hint = "RAM_BLOCK_TYPE=AUTO",   // Memory type hint
    parameter overflow_checking = "OFF",   // Check for overflow
    parameter underflow_checking = "OFF",  // Check for underflow
    parameter use_eab = "ON",              // Use embedded memory
    parameter lpm_type = "scfifo",         // Library of parameterized modules type
    parameter lpm_widthu = 2               // Address width
) (
    input  wire                   clock,      // Clock
    input  wire [lpm_width-1:0]   data,       // Input data
    input  wire                   rdreq,      // Read request
    input  wire                   sclr,       // Synchronous clear
    input  wire                   wrreq,      // Write request
    input  wire                   aclr,       // Asynchronous clear (often tied to 1'b0)
    output wire                   empty,      // Empty flag
    output wire                   full,       // Full flag
    output wire [lpm_width-1:0]   q,          // Output data
    output wire                   almost_empty, // Almost empty flag
    output wire                   almost_full,  // Almost full flag
    output wire [1:0]             eccstatus,    // ECC status
    output wire [lpm_widthu-1:0]  usedw        // Used words
);

    // Internal parameters
    localparam ADDR_WIDTH = lpm_widthu;
    
    // Memory for data storage
    reg [lpm_width-1:0] mem [0:lpm_numwords-1];
    
    // Read/write pointers
    reg [ADDR_WIDTH:0] wr_ptr;  // Extra bit for full/empty detection
    reg [ADDR_WIDTH:0] rd_ptr;  // Extra bit for full/empty detection
    
    // Output registers
    reg [lpm_width-1:0] q_reg;
    
    // Status signals
    wire empty_int;
    wire full_int;
    wire [ADDR_WIDTH:0] used_words_plus1;
    
    // Reset logic
    wire reset = sclr | aclr;
    
    // Calculate status signals
    assign empty_int = (rd_ptr == wr_ptr);
    assign full_int = (rd_ptr[ADDR_WIDTH-1:0] == wr_ptr[ADDR_WIDTH-1:0]) && 
                     (rd_ptr[ADDR_WIDTH] != wr_ptr[ADDR_WIDTH]);
    
    // Calculate used words (including extra bit)
    assign used_words_plus1 = (wr_ptr >= rd_ptr) ? 
                             (wr_ptr - rd_ptr) : 
                             ({1'b1, {ADDR_WIDTH{1'b0}}} - rd_ptr + wr_ptr);
    
    // Memory write operation
    always @(posedge clock) begin
        if (wrreq && !full_int && !reset) begin
            mem[wr_ptr[ADDR_WIDTH-1:0]] <= data;
        end
    end
    
    // Pointer and status update
    always @(posedge clock) begin
        if (reset) begin
            rd_ptr <= 0;
            wr_ptr <= 0;
            q_reg <= {lpm_width{1'b0}};
        end 
        else begin
            // Update write pointer
            if (wrreq && !full_int) begin
                wr_ptr <= wr_ptr + 1'b1;
            end
            
            // Update read pointer
            if (rdreq && !empty_int) begin
                rd_ptr <= rd_ptr + 1'b1;
                
                // Read data based on show-ahead mode
                if (lpm_showahead == "OFF" || add_ram_output_register == "ON") begin
                    q_reg <= mem[rd_ptr[ADDR_WIDTH-1:0]];
                end
            end
            
            // Show-ahead mode pre-fetches the next data
            if (lpm_showahead == "ON" && !empty_int && add_ram_output_register == "OFF") begin
                q_reg <= mem[rd_ptr[ADDR_WIDTH-1:0]];
            end
        end
    end
    
    // Output assignments
    assign empty = empty_int;
    assign full = full_int;
    assign q = q_reg;
    assign usedw = used_words_plus1[ADDR_WIDTH-1:0];
    
    // Unused outputs
    assign almost_empty = (usedw <= 1);
    assign almost_full = (usedw >= lpm_numwords - 2);
    assign eccstatus = 2'b00;  // No ECC errors
    
endmodule