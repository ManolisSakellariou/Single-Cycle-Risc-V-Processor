`include "./mux 16to1/mux_16to1_32bit.v"

module alu(input [31:0]word1 , input [31:0]word2, input [3:0]alu_ctrl, output [31:0] word_out, output zero);
    wire [31:0] a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p;
    assign a = word1 + word2;
    assign b = word1 - word2;
    assign c = word1 & word2;
    assign d = word1 | word2;
    //if one word is positive and the other negative give one if the first(word1) is negative
    assign e = (word1[31]^word2[31]) ? (word1[31]==1) : (word1 < word2);
    assign f = word1 * word2;
    assign g = word1 / word2;;
    assign h = 32'd0;
    assign i = 32'd0;
    assign j = 32'd0;
    assign k = 32'd0;
    assign l = 32'd0;
    assign m = 32'd0;
    assign n = 32'd0;
    assign o = 32'd0;
    assign p = 32'd0;

    mux_16to1_32bit mux_alu(.A(a), .B(b), .C(c), .D(d), .E(e), .F(f), .G(g), .H(h), .I(i), .J(j), .K(k), .L(l), .M(m), .N(n), .O(o), .P(p), .ctrl(alu_ctrl), .out(word_out));
    assign zero = (word_out==32'b0) ? 1:0;
    
endmodule
