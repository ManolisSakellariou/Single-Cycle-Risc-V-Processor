//rom model

module instruction_memory(input [31:0]adr, output [31:0]rdata);
    reg [31:0] instr_mem [0:128];
    integer i;
    /*initial begin
        for(i = 0; i < 127; i = i+1) begin
            instr_mem[i] = 32'd0;
        end
    end*/
    initial begin
        instr_mem[0] = 32'h06400513;
        instr_mem[1] = 32'h00A00593;
        instr_mem[2] = 32'h00B52023;
        instr_mem[3] = 32'h01400593;
        instr_mem[4] = 32'h00B52223;
        instr_mem[5] = 32'h01E00593;
        instr_mem[6] = 32'h00B52423;
        instr_mem[7] = 32'h00000293;
        instr_mem[8] = 32'h00300313;
        instr_mem[9] = 32'h00030C63;
        instr_mem[10] = 32'h00052383;
        instr_mem[11] = 32'h007282B3;
        instr_mem[12] = 32'h00450513;
        instr_mem[13] = 32'hFFF30313;
        instr_mem[14] = 32'hFE0006E3;
        instr_mem[15] = 32'h004000EF;
        instr_mem[16] = 32'h00552623;
        
    end
    
    /*initial begin
        $readmemh("riscv.text", instr_mem);
    end*/
    assign rdata = instr_mem[adr[31:2]];
    
endmodule