module decoder(input [6:0]op, input [2:0]func3, input func7, input zero_alu, output [11:0] out_signal);
    /* Main Decoder Out:signal[10]=RegWrite, signal[9:8]=ImmSrc, signal[7]=AluSrc, signal[6]=MemWrite, signal[5:4]=ResultSrc/memloadsrcs, signal[3]Branch, signal[2:1]=AluOP singal[0]=jump*/
    
    reg [10:0]main_dec_signal;
    
    reg [3:0] aluctrl;
    reg [6:0] alu_inp_signal;
    always@(*)begin
        //MainDec
        case(op)
        7'b0000011: main_dec_signal = 11'b10010010000;//lw
        7'b0100011: main_dec_signal = 11'b00111000000;//sw
        7'b0110011: main_dec_signal = 11'b10000000100;//R-type
        7'b0010011: main_dec_signal = 11'b10010000100;//I-type
        7'b1100011: main_dec_signal = 11'b01000001010;//beq
        7'b1101111: main_dec_signal = 11'b11100100001;//jal
        default: main_dec_signal = 11'd0;
        endcase

        //Alu Dec
        alu_inp_signal = {op[5], func7, func3[2:0], main_dec_signal[2:1]};
        casez(alu_inp_signal)
        7'bzzzzz00: aluctrl = 4'b0000;//add fro lw,sw
        7'bzzzzz01: aluctrl = 4'b0001;//sub fro beq
        7'b0000010: aluctrl = 4'b0000;//add
        7'b0100010: aluctrl = 4'b0000;//add
        7'b1000010: aluctrl = 4'b0000;//add
        7'b1100010: aluctrl = 4'b0001;//sub
        7'bzz01010: aluctrl = 4'b0100;//slt
        7'bzz11010: aluctrl = 4'b0011;//or
        7'bzz11110: aluctrl = 4'b0010;//and
        default: aluctrl = 4'd0;
        endcase
    end
    
    assign  branch = main_dec_signal[3];
    assign jump = main_dec_signal[0];
    
    assign out_signal [3:0] = aluctrl;
    assign out_signal [4] = (branch & zero_alu) | jump; // PcSrc to branch on beq or jump
    assign out_signal [6:5] = main_dec_signal[5:4];//ResultSrc
    assign out_signal [7] = main_dec_signal[6];//MemWrite
    assign out_signal [8] = main_dec_signal[7];//AluSrc
    assign out_signal [10:9] = main_dec_signal[9:8];//ImmSrc
    assign out_signal [11] = main_dec_signal[10];//RegWrite
endmodule