`include "./dataMemory/data_memory.v"
module mem(input [31:0]addr, input [31:0]wd, input we, input [1:0]ResultSrc, input clk, input [31:0]pc_next, output reg [31:0]mem_out);
    wire [31:0]rd;
    data_memory dmem(clk, we, addr, wd, rd);

    always@(*)begin
        
        case(ResultSrc)
        2'b00: mem_out = addr;
        2'b01: mem_out = rd;
        2'b10: mem_out = pc_next;
        default:mem_out = addr;
        endcase
    end

endmodule