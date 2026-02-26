`include "./control unit/decoder.v"
`include "./register file/register_file.v"
`include "./sign extension unit/sign_extension_unit.v"

module instr_dec(
    input [31:0] instr,
    input clk,
    input reset_rf,
    input [31:0]pc,
    input [31:0] wdata,
    input zero, 
    output [11:0]control_signals, 
    output [31:0]alu_in1, 
    output [31:0]alu_in2,
    output [31:0] rd2,
    output [31:0]branch_addr);

    wire [31:0]sign_ex_out;

    decoder cu(.op(instr[6:0]), .func3(instr[14:12]), .func7(instr[30]), .zero_alu(zero), .out_signal(control_signals));
    register_file file(.clk(clk), .we(control_signals[11]), .reset_rf(reset_rf), .adr1(instr[19:15]), .adr2(instr[24:20]), .adr3(instr[11:7]), .wdata(wdata), .rd1(alu_in1), .rd2(rd2));
    sign_extension_unit seu(instr[31:7], control_signals[10:9], sign_ex_out);

    assign alu_in2 = control_signals[8] ? sign_ex_out : rd2;//alusrc=control_signals[7]
    assign branch_addr = sign_ex_out + pc;
endmodule