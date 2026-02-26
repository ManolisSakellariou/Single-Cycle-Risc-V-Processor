`include "./alu/alu.v"

module exe(input [31:0]a, input [31:0]b, input [3:0]aluctrl, output [31:0]result, output zero_alu);
    alu alu_1(a, b, aluctrl, result, zero_alu);
endmodule