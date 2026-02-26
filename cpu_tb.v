`timescale 1ns/1ns
`include "./CPU/cpu.v"

module cpu_tb;
    reg clk=1'b0;
    reg pc_reset, rf_reset;

    cpu uut(clk, pc_reset, rf_reset);

    always begin
        clk = ~clk;
        #10;
    end

    initial begin
        $dumpfile("cpu_tb.vcd");
        $dumpvars(0, cpu_tb);

        pc_reset = 1; rf_reset = 1;#20;
        pc_reset = 0; rf_reset = 0;#580;
        $finish;
    end
endmodule