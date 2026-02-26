//ram model: byte word addressable memory

module data_memory(input clk, input we, input [31:0] address, input [31:0]wdata, output [31:0]rdata);
    reg [31:0] mem [0:255];
    integer i;
//leaving the first two bits of address turns the byte address into the word address in the memory    
    initial begin
        for(i =0; i < 256; i=i+1) begin
            mem[i] = 32'd0;
        end
    end
    always@(posedge clk) begin
        if(we) mem[address[31:2]] <= wdata;//word aligned from byte aligned
    end
    assign rdata = mem[address[31:2]];
endmodule