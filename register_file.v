module register_file(input clk, input we, input reset_rf, input [4:0]adr1, input [4:0]adr2, input [4:0]adr3, input [31:0]wdata, output [31:0] rd1, output [31:0] rd2);
    reg [31:0] rf [0:31];
    integer i;
    
    //adr3: address of the wdata
    always@(posedge clk, posedge reset_rf) begin
        if(reset_rf) 
            for(i = 0; i < 32; i=i+1) begin
                rf[i] <= 0;//initializations
            end
        else if(we) rf[adr3] <= wdata;
    end

    assign rd1 = rf[adr1];
    assign rd2 = rf[adr2];
    //same if we decalred rd as reg and a always@(*)..
endmodule