`timescale 1ns / 1ps
 
module ch(input [63:0] E,F,G, output [63:0] r);

assign r = (E & F) ^ ((~E) & G);
endmodule


module ma(input [63:0] A,B,C, output [63:0] r);

assign r = (A & B) ^ (A & C) ^ (B & C);
endmodule


module sum_A(input [63:0] A,output [63:0] r);
//{x[1:0],x[31:2]} ^ {x[12:0],x[31:13]} ^ {x[21:0],x[31:22]};
assign r = {A[27:0],A[63:28]} ^ {A[33:0],A[63:34]} ^ {A[38:0],A[63:39]};
//assign r = (A >>> 2) ^ (A >>> 13) ^ (A >>> 22);
endmodule


module sum_E(input [63:0] E,output [63:0] r);
//{x[5:0],x[31:6]} ^ {x[10:0],x[31:11]} ^ {x[24:0],x[31:25]};
//assign r = {E[5:0],E[31:6]} ^ {E[10:0],E[31:11]} ^ {E[24:0],E[31:25]};
assign r = {E[13:0],E[63:14]} ^ {E[17:0],E[63:18]} ^ {E[40:0],E[63:41]};
//assign r = (E >>> 6) ^ (E >>> 11) ^ (E >>> 25);
endmodule



module add_mod64(input [63:0] A,B,output [63:0] r);

assign r = A + B;
endmodule