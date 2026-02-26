module pc(input [31:0]branch_addr, input pcsrc, input reset, input clk, output reg [31:0]pc);
    //byte based addressed 4bytes=1word
    always@(posedge clk, posedge reset)begin
        if(reset) pc<=0;
        else if(pcsrc) pc <= branch_addr;
        else pc <= pc + 4;
    end
    
endmodule