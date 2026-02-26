module mux_16to1_32bit(
input [31:0]A,
input [31:0]B,
input [31:0]C,
input [31:0]D,
input [31:0]E,
input [31:0]F,
input [31:0]G,
input [31:0]H,
input [31:0]I,
input [31:0]J,
input [31:0]K,
input [31:0]L,
input [31:0]M,
input [31:0]N,
input [31:0]O,
input [31:0]P,
input [3:0]ctrl,
output reg [31:0] out
);

    always@(*)begin
        case(ctrl)
        4'd0: out = A;
        4'd1: out = B;
        4'd2: out = C;
        4'd3: out = D;
        4'd4: out = E;
        4'd5: out = F;
        4'd6: out = G;
        4'd7: out = H;
        4'd8: out = I;
        4'd9: out = J;
        4'd10: out = K;
        4'd11: out = L;
        4'd12: out = M;
        4'd13: out = N;
        4'd14: out = O;
        4'd15: out = P;
        endcase
    end

endmodule