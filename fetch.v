`include "./Fetch Stage/pc.v"
`include "./instruction memory/instruction_memory.v"

module fetch(input clk, input pc_src, input reset, input [31:0]branch_addr, output [31:0]instr_data, output [31:0]pc_out);
    pc prog_counter(branch_addr, pc_src, reset, clk, pc_out);
    instruction_memory im(pc_out, instr_data);

endmodule