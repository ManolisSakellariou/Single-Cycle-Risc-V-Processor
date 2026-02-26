module sign_extension_unit(input signed [31:7] instr, input [1:0]imm_src, output reg signed [31:0] out_imm);
    
    always@(*)begin
        case(imm_src)
                2'b00: out_imm = {{20{instr[31]}}, instr[31:20]};//I type
                2'b01: out_imm = {{20{instr[31]}}, instr[31], instr[31:25], instr[11:7]};//S type(12bits)
                2'b10: out_imm = {{20{instr[31]}}, instr[31], instr[7], instr[30:25], instr[11:8], 1'b0};//B type(13bits)
                2'b11: out_imm = {{20{instr[31]}}, instr[31], instr[19:12], instr[20], instr[30:21], 1'b0};//J type(20bits)
        endcase
    end
endmodule