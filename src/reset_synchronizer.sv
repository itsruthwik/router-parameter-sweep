module reset_synchronizer #(
    parameter NUM_EXTEND_CYCLES = 4,
    parameter NUM_OUTPUT_REGISTERS = 1
) (
    input wire reset_async,
    input wire sync_clk,
    output logic reset_sync
);

    logic reset_async_reg, reset_async_reg2, reset_sync_int;

    always_ff @(posedge sync_clk) begin
        reset_async_reg <= reset_async;
        reset_async_reg2 <= reset_async_reg;
    end

    generate
        if (NUM_EXTEND_CYCLES > 0) begin
            logic [NUM_EXTEND_CYCLES - 1 : 0] reset_extend;

            always_ff @(posedge sync_clk) begin
                if (NUM_EXTEND_CYCLES > 1)
                    reset_extend[NUM_EXTEND_CYCLES - 1 : 1] <= reset_extend[NUM_EXTEND_CYCLES - 2 : 0];
                reset_extend[0] <= reset_async_reg2;
            end
            
            logic reset_sync_tmp;
            always_comb begin
                reset_sync_tmp = reset_async_reg2;
                for (int i = 0; i < NUM_EXTEND_CYCLES; i = i + 1) begin
                    reset_sync_tmp = reset_sync_tmp | reset_extend[i];
                end
                reset_sync_int = reset_sync_tmp;
            end
        end 
        else begin: no_extend_cycles
            assign reset_sync_int = reset_async_reg2;
        end
    endgenerate

    generate
        if (NUM_OUTPUT_REGISTERS > 0) begin: output_registers_gen
            logic [NUM_OUTPUT_REGISTERS-1:0] reset_sync_reg;

            always_ff @(posedge sync_clk) begin
                reset_sync_reg[0] <= reset_sync_int;
                if (NUM_OUTPUT_REGISTERS > 1) begin
                    for (int i = 1; i < NUM_OUTPUT_REGISTERS; i = i + 1) begin
                        reset_sync_reg[i] <= reset_sync_reg[i - 1];
                    end
                end
            end

            assign reset_sync = reset_sync_reg[NUM_OUTPUT_REGISTERS - 1];
        end
        else begin: no_output_registers
            assign reset_sync = reset_sync_int;
        end
    endgenerate

endmodule