`include "./Fetch Stage/fetch.v"
`include "./Decode Stage/instr_dec.v"
`include "./Execute Stage/exe.v"
`include "./Memory Stage/mem.v"



module cpu(input clk, input pc_reset, input rf_reset);
    wire zero_alu;
    wire [11:0]control_signals;
    wire [31:0] instr, pc_wire, pc_next, branch_addr, wdata, alu_in1, alu_in2, rd2, alu_out;

    fetch instrf(clk, control_signals[4], pc_reset, branch_addr, instr, pc_wire);

    assign pc_next = pc_wire + 4;

    instr_dec instrd(instr, clk, rf_reset, pc_wire, wdata, zero_alu, control_signals, alu_in1, alu_in2, rd2, branch_addr);
    exe ex(alu_in1, alu_in2, control_signals[3:0], alu_out, zero_alu);
    mem memory(alu_out, rd2, control_signals[7], control_signals[6:5], clk, pc_next, wdata);

endmodule
