`timescale 1ns / 1ps
 
module Compression_function(
input clk, n_rst, start,
input [1023:0] M,
input [63:0] a,b,c,d,e,f,g,h,

output reg [63:0] o_a,o_b,o_c,o_d,o_e,o_f,o_g,o_h,
output reg done
);

localparam Ks = {
    64'h428a2f98d728ae22, 64'h7137449123ef65cd,
	64'hb5c0fbcfec4d3b2f, 64'he9b5dba58189dbbc,
	64'h3956c25bf348b538, 64'h59f111f1b605d019,
	64'h923f82a4af194f9b, 64'hab1c5ed5da6d8118,
	64'hd807aa98a3030242, 64'h12835b0145706fbe,
	64'h243185be4ee4b28c, 64'h550c7dc3d5ffb4e2,
	64'h72be5d74f27b896f, 64'h80deb1fe3b1696b1,
	64'h9bdc06a725c71235, 64'hc19bf174cf692694,
	64'he49b69c19ef14ad2, 64'hefbe4786384f25e3,
	64'h0fc19dc68b8cd5b5, 64'h240ca1cc77ac9c65,
	64'h2de92c6f592b0275, 64'h4a7484aa6ea6e483,
	64'h5cb0a9dcbd41fbd4, 64'h76f988da831153b5,
	64'h983e5152ee66dfab, 64'ha831c66d2db43210,
	64'hb00327c898fb213f, 64'hbf597fc7beef0ee4,
	64'hc6e00bf33da88fc2, 64'hd5a79147930aa725,
	64'h06ca6351e003826f, 64'h142929670a0e6e70,
	64'h27b70a8546d22ffc, 64'h2e1b21385c26c926,
	64'h4d2c6dfc5ac42aed, 64'h53380d139d95b3df,
	64'h650a73548baf63de, 64'h766a0abb3c77b2a8,
	64'h81c2c92e47edaee6, 64'h92722c851482353b,
	64'ha2bfe8a14cf10364, 64'ha81a664bbc423001,
	64'hc24b8b70d0f89791, 64'hc76c51a30654be30,
	64'hd192e819d6ef5218, 64'hd69906245565a910,
	64'hf40e35855771202a, 64'h106aa07032bbd1b8,
	64'h19a4c116b8d2d0c8, 64'h1e376c085141ab53,
	64'h2748774cdf8eeb99, 64'h34b0bcb5e19b48a8,
	64'h391c0cb3c5c95a63, 64'h4ed8aa4ae3418acb,
	64'h5b9cca4f7763e373, 64'h682e6ff3d6b2b8a3,
	64'h748f82ee5defb2fc, 64'h78a5636f43172f60,
	64'h84c87814a1f0ab72, 64'h8cc702081a6439ec,
	64'h90befffa23631e28, 64'ha4506cebde82bde9,
	64'hbef9a3f7b2c67915, 64'hc67178f2e372532b,
	64'hca273eceea26619c, 64'hd186b8c721c0c207,
	64'heada7dd6cde0eb1e, 64'hf57d4f7fee6ed178,
	64'h06f067aa72176fba, 64'h0a637dc5a2c898a6,
	64'h113f9804bef90dae, 64'h1b710b35131c471b,
	64'h28db77f523047d84, 64'h32caab7b40c72493,
	64'h3c9ebe0a15c9bebc, 64'h431d67c49c100d4c,
	64'h4cc5d4becb3e42b6, 64'h597f299cfc657e2a,
	64'h5fcb6fab3ad6faec, 64'h6c44198c4a475817};

wire [63:0]   w_0,w_1,w_2,w_3,w_4,w_5,
              w_6,w_7,w_8,w_9,w_10,w_11,
              w_12,w_13,w_14,w_15,w_16,
              w_17,w_18,w_19,w_20,w_21,
              w_22,w_23,w_24,w_25,w_26,
              w_27,w_28,w_29,w_30,w_31,
              w_32,w_33,w_34,w_35,w_36,
              w_37,w_38,w_39,w_40,w_41,
              w_42,w_43,w_44,w_45,w_46,
              w_47,w_48,w_49,w_50,w_51,
              w_52,w_53,w_54,w_55,w_56,
              w_57,w_58,w_59,w_60,w_61,
              w_62,w_63,w_64,w_65,w_66,
              w_67,w_68,w_69,w_70,w_71,
              w_72,w_73,w_74,w_75,w_76,
              w_77,w_78,w_79;
message_schedule mes_schedule(.M(M), 
.w_0(w_0),.w_1(w_1),.w_2(w_2),.w_3(w_3),.w_4(w_4),
.w_5(w_5),.w_6(w_6),.w_7(w_7),.w_8(w_8),.w_9(w_9),
.w_10(w_10),.w_11(w_11),.w_12(w_12),.w_13(w_13),
.w_14(w_14),.w_15(w_15),.w_16(w_16),.w_17(w_17),
.w_18(w_18),.w_19(w_19),.w_20(w_20),.w_21(w_21),
.w_22(w_22),.w_23(w_23),.w_24(w_24),.w_25(w_25),
.w_26(w_26),.w_27(w_27),.w_28(w_28),.w_29(w_29),
.w_30(w_30),.w_31(w_31),.w_32(w_32),.w_33(w_33),
.w_34(w_34),.w_35(w_35),.w_36(w_36),.w_37(w_37),
.w_38(w_38),.w_39(w_39),.w_40(w_40),.w_41(w_41),
.w_42(w_42),.w_43(w_43),.w_44(w_44),.w_45(w_45),
.w_46(w_46),.w_47(w_47),.w_48(w_48),.w_49(w_49),
.w_50(w_50),.w_51(w_51),.w_52(w_52),.w_53(w_53),
.w_54(w_54),.w_55(w_55),.w_56(w_56),.w_57(w_57),
.w_58(w_58),.w_59(w_59),.w_60(w_60),.w_61(w_61),
.w_62(w_62),.w_63(w_63),.w_64(w_64),.w_65(w_65),
.w_66(w_66),.w_67(w_67),.w_68(w_68),.w_69(w_69),
.w_70(w_70),.w_71(w_71),.w_72(w_72),.w_73(w_73),
.w_74(w_74),.w_75(w_75),.w_76(w_76),.w_77(w_77),
.w_78(w_78),.w_79(w_79));
    
wire [63:0]a_0,b_0,c_0,d_0,e_0,f_0,g_0,h_0;
wire rnd_0_done;
round r_0(.clk(clk),.n_rst(n_rst),.start(start),
.a(a),.b(b),.c(c),.d(d),.e(e),.f(f),.g(g),.h(h),
.W(w_0),.K(Ks[5119:5056]),
.o_a(a_0),.o_b(b_0),.o_c(c_0),.o_d(d_0),.o_e(e_0),.o_f(f_0),.o_g(g_0),.o_h(h_0),.done(rnd_0_done)
 );
 	wire [63:0] a_1,b_1,c_1,d_1,e_1,f_1,g_1,h_1;
wire rnd_1_done;
round r_1(.clk(clk),.n_rst(n_rst),.start(rnd_0_done),
.a(a_0),.b(b_0),.c(c_0),.d(d_0),.e(e_0),.f(f_0),.g(g_0),.h(h_0),
.W(w_1),.K(Ks[5055:4992]),
.o_a(a_1),.o_b(b_1),.o_c(c_1),.o_d(d_1),.o_e(e_1),.o_f(f_1),.o_g(g_1),.o_h(h_1),.done(rnd_1_done));


wire [63:0] a_2,b_2,c_2,d_2,e_2,f_2,g_2,h_2;
wire rnd_2_done;
round r_2(.clk(clk),.n_rst(n_rst),.start(rnd_1_done),
.a(a_1),.b(b_1),.c(c_1),.d(d_1),.e(e_1),.f(f_1),.g(g_1),.h(h_1),
.W(w_2),.K(Ks[4991:4928]),
.o_a(a_2),.o_b(b_2),.o_c(c_2),.o_d(d_2),.o_e(e_2),.o_f(f_2),.o_g(g_2),.o_h(h_2),.done(rnd_2_done));


wire [63:0] a_3,b_3,c_3,d_3,e_3,f_3,g_3,h_3;
wire rnd_3_done;
round r_3(.clk(clk),.n_rst(n_rst),.start(rnd_2_done),
.a(a_2),.b(b_2),.c(c_2),.d(d_2),.e(e_2),.f(f_2),.g(g_2),.h(h_2),
.W(w_3),.K(Ks[4927:4864]),
.o_a(a_3),.o_b(b_3),.o_c(c_3),.o_d(d_3),.o_e(e_3),.o_f(f_3),.o_g(g_3),.o_h(h_3),.done(rnd_3_done));


wire [63:0] a_4,b_4,c_4,d_4,e_4,f_4,g_4,h_4;
wire rnd_4_done;
round r_4(.clk(clk),.n_rst(n_rst),.start(rnd_3_done),
.a(a_3),.b(b_3),.c(c_3),.d(d_3),.e(e_3),.f(f_3),.g(g_3),.h(h_3),
.W(w_4),.K(Ks[4863:4800]),
.o_a(a_4),.o_b(b_4),.o_c(c_4),.o_d(d_4),.o_e(e_4),.o_f(f_4),.o_g(g_4),.o_h(h_4),.done(rnd_4_done));


wire [63:0] a_5,b_5,c_5,d_5,e_5,f_5,g_5,h_5;
wire rnd_5_done;
round r_5(.clk(clk),.n_rst(n_rst),.start(rnd_4_done),
.a(a_4),.b(b_4),.c(c_4),.d(d_4),.e(e_4),.f(f_4),.g(g_4),.h(h_4),
.W(w_5),.K(Ks[4799:4736]),
.o_a(a_5),.o_b(b_5),.o_c(c_5),.o_d(d_5),.o_e(e_5),.o_f(f_5),.o_g(g_5),.o_h(h_5),.done(rnd_5_done));


wire [63:0] a_6,b_6,c_6,d_6,e_6,f_6,g_6,h_6;
wire rnd_6_done;
round r_6(.clk(clk),.n_rst(n_rst),.start(rnd_5_done),
.a(a_5),.b(b_5),.c(c_5),.d(d_5),.e(e_5),.f(f_5),.g(g_5),.h(h_5),
.W(w_6),.K(Ks[4735:4672]),
.o_a(a_6),.o_b(b_6),.o_c(c_6),.o_d(d_6),.o_e(e_6),.o_f(f_6),.o_g(g_6),.o_h(h_6),.done(rnd_6_done));


wire [63:0] a_7,b_7,c_7,d_7,e_7,f_7,g_7,h_7;
wire rnd_7_done;
round r_7(.clk(clk),.n_rst(n_rst),.start(rnd_6_done),
.a(a_6),.b(b_6),.c(c_6),.d(d_6),.e(e_6),.f(f_6),.g(g_6),.h(h_6),
.W(w_7),.K(Ks[4671:4608]),
.o_a(a_7),.o_b(b_7),.o_c(c_7),.o_d(d_7),.o_e(e_7),.o_f(f_7),.o_g(g_7),.o_h(h_7),.done(rnd_7_done));


wire [63:0] a_8,b_8,c_8,d_8,e_8,f_8,g_8,h_8;
wire rnd_8_done;
round r_8(.clk(clk),.n_rst(n_rst),.start(rnd_7_done),
.a(a_7),.b(b_7),.c(c_7),.d(d_7),.e(e_7),.f(f_7),.g(g_7),.h(h_7),
.W(w_8),.K(Ks[4607:4544]),
.o_a(a_8),.o_b(b_8),.o_c(c_8),.o_d(d_8),.o_e(e_8),.o_f(f_8),.o_g(g_8),.o_h(h_8),.done(rnd_8_done));


wire [63:0] a_9,b_9,c_9,d_9,e_9,f_9,g_9,h_9;
wire rnd_9_done;
round r_9(.clk(clk),.n_rst(n_rst),.start(rnd_8_done),
.a(a_8),.b(b_8),.c(c_8),.d(d_8),.e(e_8),.f(f_8),.g(g_8),.h(h_8),
.W(w_9),.K(Ks[4543:4480]),
.o_a(a_9),.o_b(b_9),.o_c(c_9),.o_d(d_9),.o_e(e_9),.o_f(f_9),.o_g(g_9),.o_h(h_9),.done(rnd_9_done));


wire [63:0] a_10,b_10,c_10,d_10,e_10,f_10,g_10,h_10;
wire rnd_10_done;
round r_10(.clk(clk),.n_rst(n_rst),.start(rnd_9_done),
.a(a_9),.b(b_9),.c(c_9),.d(d_9),.e(e_9),.f(f_9),.g(g_9),.h(h_9),
.W(w_10),.K(Ks[4479:4416]),
.o_a(a_10),.o_b(b_10),.o_c(c_10),.o_d(d_10),.o_e(e_10),.o_f(f_10),.o_g(g_10),.o_h(h_10),.done(rnd_10_done));


wire [63:0] a_11,b_11,c_11,d_11,e_11,f_11,g_11,h_11;
wire rnd_11_done;
round r_11(.clk(clk),.n_rst(n_rst),.start(rnd_10_done),
.a(a_10),.b(b_10),.c(c_10),.d(d_10),.e(e_10),.f(f_10),.g(g_10),.h(h_10),
.W(w_11),.K(Ks[4415:4352]),
.o_a(a_11),.o_b(b_11),.o_c(c_11),.o_d(d_11),.o_e(e_11),.o_f(f_11),.o_g(g_11),.o_h(h_11),.done(rnd_11_done));


wire [63:0] a_12,b_12,c_12,d_12,e_12,f_12,g_12,h_12;
wire rnd_12_done;
round r_12(.clk(clk),.n_rst(n_rst),.start(rnd_11_done),
.a(a_11),.b(b_11),.c(c_11),.d(d_11),.e(e_11),.f(f_11),.g(g_11),.h(h_11),
.W(w_12),.K(Ks[4351:4288]),
.o_a(a_12),.o_b(b_12),.o_c(c_12),.o_d(d_12),.o_e(e_12),.o_f(f_12),.o_g(g_12),.o_h(h_12),.done(rnd_12_done));


wire [63:0] a_13,b_13,c_13,d_13,e_13,f_13,g_13,h_13;
wire rnd_13_done;
round r_13(.clk(clk),.n_rst(n_rst),.start(rnd_12_done),
.a(a_12),.b(b_12),.c(c_12),.d(d_12),.e(e_12),.f(f_12),.g(g_12),.h(h_12),
.W(w_13),.K(Ks[4287:4224]),
.o_a(a_13),.o_b(b_13),.o_c(c_13),.o_d(d_13),.o_e(e_13),.o_f(f_13),.o_g(g_13),.o_h(h_13),.done(rnd_13_done));


wire [63:0] a_14,b_14,c_14,d_14,e_14,f_14,g_14,h_14;
wire rnd_14_done;
round r_14(.clk(clk),.n_rst(n_rst),.start(rnd_13_done),
.a(a_13),.b(b_13),.c(c_13),.d(d_13),.e(e_13),.f(f_13),.g(g_13),.h(h_13),
.W(w_14),.K(Ks[4223:4160]),
.o_a(a_14),.o_b(b_14),.o_c(c_14),.o_d(d_14),.o_e(e_14),.o_f(f_14),.o_g(g_14),.o_h(h_14),.done(rnd_14_done));


wire [63:0] a_15,b_15,c_15,d_15,e_15,f_15,g_15,h_15;
wire rnd_15_done;
round r_15(.clk(clk),.n_rst(n_rst),.start(rnd_14_done),
.a(a_14),.b(b_14),.c(c_14),.d(d_14),.e(e_14),.f(f_14),.g(g_14),.h(h_14),
.W(w_15),.K(Ks[4159:4096]),
.o_a(a_15),.o_b(b_15),.o_c(c_15),.o_d(d_15),.o_e(e_15),.o_f(f_15),.o_g(g_15),.o_h(h_15),.done(rnd_15_done));


wire [63:0] a_16,b_16,c_16,d_16,e_16,f_16,g_16,h_16;
wire rnd_16_done;
round r_16(.clk(clk),.n_rst(n_rst),.start(rnd_15_done),
.a(a_15),.b(b_15),.c(c_15),.d(d_15),.e(e_15),.f(f_15),.g(g_15),.h(h_15),
.W(w_16),.K(Ks[4095:4032]),
.o_a(a_16),.o_b(b_16),.o_c(c_16),.o_d(d_16),.o_e(e_16),.o_f(f_16),.o_g(g_16),.o_h(h_16),.done(rnd_16_done));


wire [63:0] a_17,b_17,c_17,d_17,e_17,f_17,g_17,h_17;
wire rnd_17_done;
round r_17(.clk(clk),.n_rst(n_rst),.start(rnd_16_done),
.a(a_16),.b(b_16),.c(c_16),.d(d_16),.e(e_16),.f(f_16),.g(g_16),.h(h_16),
.W(w_17),.K(Ks[4031:3968]),
.o_a(a_17),.o_b(b_17),.o_c(c_17),.o_d(d_17),.o_e(e_17),.o_f(f_17),.o_g(g_17),.o_h(h_17),.done(rnd_17_done));


wire [63:0] a_18,b_18,c_18,d_18,e_18,f_18,g_18,h_18;
wire rnd_18_done;
round r_18(.clk(clk),.n_rst(n_rst),.start(rnd_17_done),
.a(a_17),.b(b_17),.c(c_17),.d(d_17),.e(e_17),.f(f_17),.g(g_17),.h(h_17),
.W(w_18),.K(Ks[3967:3904]),
.o_a(a_18),.o_b(b_18),.o_c(c_18),.o_d(d_18),.o_e(e_18),.o_f(f_18),.o_g(g_18),.o_h(h_18),.done(rnd_18_done));


wire [63:0] a_19,b_19,c_19,d_19,e_19,f_19,g_19,h_19;
wire rnd_19_done;
round r_19(.clk(clk),.n_rst(n_rst),.start(rnd_18_done),
.a(a_18),.b(b_18),.c(c_18),.d(d_18),.e(e_18),.f(f_18),.g(g_18),.h(h_18),
.W(w_19),.K(Ks[3903:3840]),
.o_a(a_19),.o_b(b_19),.o_c(c_19),.o_d(d_19),.o_e(e_19),.o_f(f_19),.o_g(g_19),.o_h(h_19),.done(rnd_19_done));


wire [63:0] a_20,b_20,c_20,d_20,e_20,f_20,g_20,h_20;
wire rnd_20_done;
round r_20(.clk(clk),.n_rst(n_rst),.start(rnd_19_done),
.a(a_19),.b(b_19),.c(c_19),.d(d_19),.e(e_19),.f(f_19),.g(g_19),.h(h_19),
.W(w_20),.K(Ks[3839:3776]),
.o_a(a_20),.o_b(b_20),.o_c(c_20),.o_d(d_20),.o_e(e_20),.o_f(f_20),.o_g(g_20),.o_h(h_20),.done(rnd_20_done));


wire [63:0] a_21,b_21,c_21,d_21,e_21,f_21,g_21,h_21;
wire rnd_21_done;
round r_21(.clk(clk),.n_rst(n_rst),.start(rnd_20_done),
.a(a_20),.b(b_20),.c(c_20),.d(d_20),.e(e_20),.f(f_20),.g(g_20),.h(h_20),
.W(w_21),.K(Ks[3775:3712]),
.o_a(a_21),.o_b(b_21),.o_c(c_21),.o_d(d_21),.o_e(e_21),.o_f(f_21),.o_g(g_21),.o_h(h_21),.done(rnd_21_done));


wire [63:0] a_22,b_22,c_22,d_22,e_22,f_22,g_22,h_22;
wire rnd_22_done;
round r_22(.clk(clk),.n_rst(n_rst),.start(rnd_21_done),
.a(a_21),.b(b_21),.c(c_21),.d(d_21),.e(e_21),.f(f_21),.g(g_21),.h(h_21),
.W(w_22),.K(Ks[3711:3648]),
.o_a(a_22),.o_b(b_22),.o_c(c_22),.o_d(d_22),.o_e(e_22),.o_f(f_22),.o_g(g_22),.o_h(h_22),.done(rnd_22_done));


wire [63:0] a_23,b_23,c_23,d_23,e_23,f_23,g_23,h_23;
wire rnd_23_done;
round r_23(.clk(clk),.n_rst(n_rst),.start(rnd_22_done),
.a(a_22),.b(b_22),.c(c_22),.d(d_22),.e(e_22),.f(f_22),.g(g_22),.h(h_22),
.W(w_23),.K(Ks[3647:3584]),
.o_a(a_23),.o_b(b_23),.o_c(c_23),.o_d(d_23),.o_e(e_23),.o_f(f_23),.o_g(g_23),.o_h(h_23),.done(rnd_23_done));


wire [63:0] a_24,b_24,c_24,d_24,e_24,f_24,g_24,h_24;
wire rnd_24_done;
round r_24(.clk(clk),.n_rst(n_rst),.start(rnd_23_done),
.a(a_23),.b(b_23),.c(c_23),.d(d_23),.e(e_23),.f(f_23),.g(g_23),.h(h_23),
.W(w_24),.K(Ks[3583:3520]),
.o_a(a_24),.o_b(b_24),.o_c(c_24),.o_d(d_24),.o_e(e_24),.o_f(f_24),.o_g(g_24),.o_h(h_24),.done(rnd_24_done));


wire [63:0] a_25,b_25,c_25,d_25,e_25,f_25,g_25,h_25;
wire rnd_25_done;
round r_25(.clk(clk),.n_rst(n_rst),.start(rnd_24_done),
.a(a_24),.b(b_24),.c(c_24),.d(d_24),.e(e_24),.f(f_24),.g(g_24),.h(h_24),
.W(w_25),.K(Ks[3519:3456]),
.o_a(a_25),.o_b(b_25),.o_c(c_25),.o_d(d_25),.o_e(e_25),.o_f(f_25),.o_g(g_25),.o_h(h_25),.done(rnd_25_done));


wire [63:0] a_26,b_26,c_26,d_26,e_26,f_26,g_26,h_26;
wire rnd_26_done;
round r_26(.clk(clk),.n_rst(n_rst),.start(rnd_25_done),
.a(a_25),.b(b_25),.c(c_25),.d(d_25),.e(e_25),.f(f_25),.g(g_25),.h(h_25),
.W(w_26),.K(Ks[3455:3392]),
.o_a(a_26),.o_b(b_26),.o_c(c_26),.o_d(d_26),.o_e(e_26),.o_f(f_26),.o_g(g_26),.o_h(h_26),.done(rnd_26_done));


wire [63:0] a_27,b_27,c_27,d_27,e_27,f_27,g_27,h_27;
wire rnd_27_done;
round r_27(.clk(clk),.n_rst(n_rst),.start(rnd_26_done),
.a(a_26),.b(b_26),.c(c_26),.d(d_26),.e(e_26),.f(f_26),.g(g_26),.h(h_26),
.W(w_27),.K(Ks[3391:3328]),
.o_a(a_27),.o_b(b_27),.o_c(c_27),.o_d(d_27),.o_e(e_27),.o_f(f_27),.o_g(g_27),.o_h(h_27),.done(rnd_27_done));


wire [63:0] a_28,b_28,c_28,d_28,e_28,f_28,g_28,h_28;
wire rnd_28_done;
round r_28(.clk(clk),.n_rst(n_rst),.start(rnd_27_done),
.a(a_27),.b(b_27),.c(c_27),.d(d_27),.e(e_27),.f(f_27),.g(g_27),.h(h_27),
.W(w_28),.K(Ks[3327:3264]),
.o_a(a_28),.o_b(b_28),.o_c(c_28),.o_d(d_28),.o_e(e_28),.o_f(f_28),.o_g(g_28),.o_h(h_28),.done(rnd_28_done));


wire [63:0] a_29,b_29,c_29,d_29,e_29,f_29,g_29,h_29;
wire rnd_29_done;
round r_29(.clk(clk),.n_rst(n_rst),.start(rnd_28_done),
.a(a_28),.b(b_28),.c(c_28),.d(d_28),.e(e_28),.f(f_28),.g(g_28),.h(h_28),
.W(w_29),.K(Ks[3263:3200]),
.o_a(a_29),.o_b(b_29),.o_c(c_29),.o_d(d_29),.o_e(e_29),.o_f(f_29),.o_g(g_29),.o_h(h_29),.done(rnd_29_done));


wire [63:0] a_30,b_30,c_30,d_30,e_30,f_30,g_30,h_30;
wire rnd_30_done;
round r_30(.clk(clk),.n_rst(n_rst),.start(rnd_29_done),
.a(a_29),.b(b_29),.c(c_29),.d(d_29),.e(e_29),.f(f_29),.g(g_29),.h(h_29),
.W(w_30),.K(Ks[3199:3136]),
.o_a(a_30),.o_b(b_30),.o_c(c_30),.o_d(d_30),.o_e(e_30),.o_f(f_30),.o_g(g_30),.o_h(h_30),.done(rnd_30_done));


wire [63:0] a_31,b_31,c_31,d_31,e_31,f_31,g_31,h_31;
wire rnd_31_done;
round r_31(.clk(clk),.n_rst(n_rst),.start(rnd_30_done),
.a(a_30),.b(b_30),.c(c_30),.d(d_30),.e(e_30),.f(f_30),.g(g_30),.h(h_30),
.W(w_31),.K(Ks[3135:3072]),
.o_a(a_31),.o_b(b_31),.o_c(c_31),.o_d(d_31),.o_e(e_31),.o_f(f_31),.o_g(g_31),.o_h(h_31),.done(rnd_31_done));


wire [63:0] a_32,b_32,c_32,d_32,e_32,f_32,g_32,h_32;
wire rnd_32_done;
round r_32(.clk(clk),.n_rst(n_rst),.start(rnd_31_done),
.a(a_31),.b(b_31),.c(c_31),.d(d_31),.e(e_31),.f(f_31),.g(g_31),.h(h_31),
.W(w_32),.K(Ks[3071:3008]),
.o_a(a_32),.o_b(b_32),.o_c(c_32),.o_d(d_32),.o_e(e_32),.o_f(f_32),.o_g(g_32),.o_h(h_32),.done(rnd_32_done));


wire [63:0] a_33,b_33,c_33,d_33,e_33,f_33,g_33,h_33;
wire rnd_33_done;
round r_33(.clk(clk),.n_rst(n_rst),.start(rnd_32_done),
.a(a_32),.b(b_32),.c(c_32),.d(d_32),.e(e_32),.f(f_32),.g(g_32),.h(h_32),
.W(w_33),.K(Ks[3007:2944]),
.o_a(a_33),.o_b(b_33),.o_c(c_33),.o_d(d_33),.o_e(e_33),.o_f(f_33),.o_g(g_33),.o_h(h_33),.done(rnd_33_done));


wire [63:0] a_34,b_34,c_34,d_34,e_34,f_34,g_34,h_34;
wire rnd_34_done;
round r_34(.clk(clk),.n_rst(n_rst),.start(rnd_33_done),
.a(a_33),.b(b_33),.c(c_33),.d(d_33),.e(e_33),.f(f_33),.g(g_33),.h(h_33),
.W(w_34),.K(Ks[2943:2880]),
.o_a(a_34),.o_b(b_34),.o_c(c_34),.o_d(d_34),.o_e(e_34),.o_f(f_34),.o_g(g_34),.o_h(h_34),.done(rnd_34_done));


wire [63:0] a_35,b_35,c_35,d_35,e_35,f_35,g_35,h_35;
wire rnd_35_done;
round r_35(.clk(clk),.n_rst(n_rst),.start(rnd_34_done),
.a(a_34),.b(b_34),.c(c_34),.d(d_34),.e(e_34),.f(f_34),.g(g_34),.h(h_34),
.W(w_35),.K(Ks[2879:2816]),
.o_a(a_35),.o_b(b_35),.o_c(c_35),.o_d(d_35),.o_e(e_35),.o_f(f_35),.o_g(g_35),.o_h(h_35),.done(rnd_35_done));


wire [63:0] a_36,b_36,c_36,d_36,e_36,f_36,g_36,h_36;
wire rnd_36_done;
round r_36(.clk(clk),.n_rst(n_rst),.start(rnd_35_done),
.a(a_35),.b(b_35),.c(c_35),.d(d_35),.e(e_35),.f(f_35),.g(g_35),.h(h_35),
.W(w_36),.K(Ks[2815:2752]),
.o_a(a_36),.o_b(b_36),.o_c(c_36),.o_d(d_36),.o_e(e_36),.o_f(f_36),.o_g(g_36),.o_h(h_36),.done(rnd_36_done));


wire [63:0] a_37,b_37,c_37,d_37,e_37,f_37,g_37,h_37;
wire rnd_37_done;
round r_37(.clk(clk),.n_rst(n_rst),.start(rnd_36_done),
.a(a_36),.b(b_36),.c(c_36),.d(d_36),.e(e_36),.f(f_36),.g(g_36),.h(h_36),
.W(w_37),.K(Ks[2751:2688]),
.o_a(a_37),.o_b(b_37),.o_c(c_37),.o_d(d_37),.o_e(e_37),.o_f(f_37),.o_g(g_37),.o_h(h_37),.done(rnd_37_done));


wire [63:0] a_38,b_38,c_38,d_38,e_38,f_38,g_38,h_38;
wire rnd_38_done;
round r_38(.clk(clk),.n_rst(n_rst),.start(rnd_37_done),
.a(a_37),.b(b_37),.c(c_37),.d(d_37),.e(e_37),.f(f_37),.g(g_37),.h(h_37),
.W(w_38),.K(Ks[2687:2624]),
.o_a(a_38),.o_b(b_38),.o_c(c_38),.o_d(d_38),.o_e(e_38),.o_f(f_38),.o_g(g_38),.o_h(h_38),.done(rnd_38_done));


wire [63:0] a_39,b_39,c_39,d_39,e_39,f_39,g_39,h_39;
wire rnd_39_done;
round r_39(.clk(clk),.n_rst(n_rst),.start(rnd_38_done),
.a(a_38),.b(b_38),.c(c_38),.d(d_38),.e(e_38),.f(f_38),.g(g_38),.h(h_38),
.W(w_39),.K(Ks[2623:2560]),
.o_a(a_39),.o_b(b_39),.o_c(c_39),.o_d(d_39),.o_e(e_39),.o_f(f_39),.o_g(g_39),.o_h(h_39),.done(rnd_39_done));


wire [63:0] a_40,b_40,c_40,d_40,e_40,f_40,g_40,h_40;
wire rnd_40_done;
round r_40(.clk(clk),.n_rst(n_rst),.start(rnd_39_done),
.a(a_39),.b(b_39),.c(c_39),.d(d_39),.e(e_39),.f(f_39),.g(g_39),.h(h_39),
.W(w_40),.K(Ks[2559:2496]),
.o_a(a_40),.o_b(b_40),.o_c(c_40),.o_d(d_40),.o_e(e_40),.o_f(f_40),.o_g(g_40),.o_h(h_40),.done(rnd_40_done));


wire [63:0] a_41,b_41,c_41,d_41,e_41,f_41,g_41,h_41;
wire rnd_41_done;
round r_41(.clk(clk),.n_rst(n_rst),.start(rnd_40_done),
.a(a_40),.b(b_40),.c(c_40),.d(d_40),.e(e_40),.f(f_40),.g(g_40),.h(h_40),
.W(w_41),.K(Ks[2495:2432]),
.o_a(a_41),.o_b(b_41),.o_c(c_41),.o_d(d_41),.o_e(e_41),.o_f(f_41),.o_g(g_41),.o_h(h_41),.done(rnd_41_done));


wire [63:0] a_42,b_42,c_42,d_42,e_42,f_42,g_42,h_42;
wire rnd_42_done;
round r_42(.clk(clk),.n_rst(n_rst),.start(rnd_41_done),
.a(a_41),.b(b_41),.c(c_41),.d(d_41),.e(e_41),.f(f_41),.g(g_41),.h(h_41),
.W(w_42),.K(Ks[2431:2368]),
.o_a(a_42),.o_b(b_42),.o_c(c_42),.o_d(d_42),.o_e(e_42),.o_f(f_42),.o_g(g_42),.o_h(h_42),.done(rnd_42_done));


wire [63:0] a_43,b_43,c_43,d_43,e_43,f_43,g_43,h_43;
wire rnd_43_done;
round r_43(.clk(clk),.n_rst(n_rst),.start(rnd_42_done),
.a(a_42),.b(b_42),.c(c_42),.d(d_42),.e(e_42),.f(f_42),.g(g_42),.h(h_42),
.W(w_43),.K(Ks[2367:2304]),
.o_a(a_43),.o_b(b_43),.o_c(c_43),.o_d(d_43),.o_e(e_43),.o_f(f_43),.o_g(g_43),.o_h(h_43),.done(rnd_43_done));


wire [63:0] a_44,b_44,c_44,d_44,e_44,f_44,g_44,h_44;
wire rnd_44_done;
round r_44(.clk(clk),.n_rst(n_rst),.start(rnd_43_done),
.a(a_43),.b(b_43),.c(c_43),.d(d_43),.e(e_43),.f(f_43),.g(g_43),.h(h_43),
.W(w_44),.K(Ks[2303:2240]),
.o_a(a_44),.o_b(b_44),.o_c(c_44),.o_d(d_44),.o_e(e_44),.o_f(f_44),.o_g(g_44),.o_h(h_44),.done(rnd_44_done));


wire [63:0] a_45,b_45,c_45,d_45,e_45,f_45,g_45,h_45;
wire rnd_45_done;
round r_45(.clk(clk),.n_rst(n_rst),.start(rnd_44_done),
.a(a_44),.b(b_44),.c(c_44),.d(d_44),.e(e_44),.f(f_44),.g(g_44),.h(h_44),
.W(w_45),.K(Ks[2239:2176]),
.o_a(a_45),.o_b(b_45),.o_c(c_45),.o_d(d_45),.o_e(e_45),.o_f(f_45),.o_g(g_45),.o_h(h_45),.done(rnd_45_done));


wire [63:0] a_46,b_46,c_46,d_46,e_46,f_46,g_46,h_46;
wire rnd_46_done;
round r_46(.clk(clk),.n_rst(n_rst),.start(rnd_45_done),
.a(a_45),.b(b_45),.c(c_45),.d(d_45),.e(e_45),.f(f_45),.g(g_45),.h(h_45),
.W(w_46),.K(Ks[2175:2112]),
.o_a(a_46),.o_b(b_46),.o_c(c_46),.o_d(d_46),.o_e(e_46),.o_f(f_46),.o_g(g_46),.o_h(h_46),.done(rnd_46_done));


wire [63:0] a_47,b_47,c_47,d_47,e_47,f_47,g_47,h_47;
wire rnd_47_done;
round r_47(.clk(clk),.n_rst(n_rst),.start(rnd_46_done),
.a(a_46),.b(b_46),.c(c_46),.d(d_46),.e(e_46),.f(f_46),.g(g_46),.h(h_46),
.W(w_47),.K(Ks[2111:2048]),
.o_a(a_47),.o_b(b_47),.o_c(c_47),.o_d(d_47),.o_e(e_47),.o_f(f_47),.o_g(g_47),.o_h(h_47),.done(rnd_47_done));


wire [63:0] a_48,b_48,c_48,d_48,e_48,f_48,g_48,h_48;
wire rnd_48_done;
round r_48(.clk(clk),.n_rst(n_rst),.start(rnd_47_done),
.a(a_47),.b(b_47),.c(c_47),.d(d_47),.e(e_47),.f(f_47),.g(g_47),.h(h_47),
.W(w_48),.K(Ks[2047:1984]),
.o_a(a_48),.o_b(b_48),.o_c(c_48),.o_d(d_48),.o_e(e_48),.o_f(f_48),.o_g(g_48),.o_h(h_48),.done(rnd_48_done));


wire [63:0] a_49,b_49,c_49,d_49,e_49,f_49,g_49,h_49;
wire rnd_49_done;
round r_49(.clk(clk),.n_rst(n_rst),.start(rnd_48_done),
.a(a_48),.b(b_48),.c(c_48),.d(d_48),.e(e_48),.f(f_48),.g(g_48),.h(h_48),
.W(w_49),.K(Ks[1983:1920]),
.o_a(a_49),.o_b(b_49),.o_c(c_49),.o_d(d_49),.o_e(e_49),.o_f(f_49),.o_g(g_49),.o_h(h_49),.done(rnd_49_done));


wire [63:0] a_50,b_50,c_50,d_50,e_50,f_50,g_50,h_50;
wire rnd_50_done;
round r_50(.clk(clk),.n_rst(n_rst),.start(rnd_49_done),
.a(a_49),.b(b_49),.c(c_49),.d(d_49),.e(e_49),.f(f_49),.g(g_49),.h(h_49),
.W(w_50),.K(Ks[1919:1856]),
.o_a(a_50),.o_b(b_50),.o_c(c_50),.o_d(d_50),.o_e(e_50),.o_f(f_50),.o_g(g_50),.o_h(h_50),.done(rnd_50_done));


wire [63:0] a_51,b_51,c_51,d_51,e_51,f_51,g_51,h_51;
wire rnd_51_done;
round r_51(.clk(clk),.n_rst(n_rst),.start(rnd_50_done),
.a(a_50),.b(b_50),.c(c_50),.d(d_50),.e(e_50),.f(f_50),.g(g_50),.h(h_50),
.W(w_51),.K(Ks[1855:1792]),
.o_a(a_51),.o_b(b_51),.o_c(c_51),.o_d(d_51),.o_e(e_51),.o_f(f_51),.o_g(g_51),.o_h(h_51),.done(rnd_51_done));


wire [63:0] a_52,b_52,c_52,d_52,e_52,f_52,g_52,h_52;
wire rnd_52_done;
round r_52(.clk(clk),.n_rst(n_rst),.start(rnd_51_done),
.a(a_51),.b(b_51),.c(c_51),.d(d_51),.e(e_51),.f(f_51),.g(g_51),.h(h_51),
.W(w_52),.K(Ks[1791:1728]),
.o_a(a_52),.o_b(b_52),.o_c(c_52),.o_d(d_52),.o_e(e_52),.o_f(f_52),.o_g(g_52),.o_h(h_52),.done(rnd_52_done));


wire [63:0] a_53,b_53,c_53,d_53,e_53,f_53,g_53,h_53;
wire rnd_53_done;
round r_53(.clk(clk),.n_rst(n_rst),.start(rnd_52_done),
.a(a_52),.b(b_52),.c(c_52),.d(d_52),.e(e_52),.f(f_52),.g(g_52),.h(h_52),
.W(w_53),.K(Ks[1727:1664]),
.o_a(a_53),.o_b(b_53),.o_c(c_53),.o_d(d_53),.o_e(e_53),.o_f(f_53),.o_g(g_53),.o_h(h_53),.done(rnd_53_done));


wire [63:0] a_54,b_54,c_54,d_54,e_54,f_54,g_54,h_54;
wire rnd_54_done;
round r_54(.clk(clk),.n_rst(n_rst),.start(rnd_53_done),
.a(a_53),.b(b_53),.c(c_53),.d(d_53),.e(e_53),.f(f_53),.g(g_53),.h(h_53),
.W(w_54),.K(Ks[1663:1600]),
.o_a(a_54),.o_b(b_54),.o_c(c_54),.o_d(d_54),.o_e(e_54),.o_f(f_54),.o_g(g_54),.o_h(h_54),.done(rnd_54_done));


wire [63:0] a_55,b_55,c_55,d_55,e_55,f_55,g_55,h_55;
wire rnd_55_done;
round r_55(.clk(clk),.n_rst(n_rst),.start(rnd_54_done),
.a(a_54),.b(b_54),.c(c_54),.d(d_54),.e(e_54),.f(f_54),.g(g_54),.h(h_54),
.W(w_55),.K(Ks[1599:1536]),
.o_a(a_55),.o_b(b_55),.o_c(c_55),.o_d(d_55),.o_e(e_55),.o_f(f_55),.o_g(g_55),.o_h(h_55),.done(rnd_55_done));


wire [63:0] a_56,b_56,c_56,d_56,e_56,f_56,g_56,h_56;
wire rnd_56_done;
round r_56(.clk(clk),.n_rst(n_rst),.start(rnd_55_done),
.a(a_55),.b(b_55),.c(c_55),.d(d_55),.e(e_55),.f(f_55),.g(g_55),.h(h_55),
.W(w_56),.K(Ks[1535:1472]),
.o_a(a_56),.o_b(b_56),.o_c(c_56),.o_d(d_56),.o_e(e_56),.o_f(f_56),.o_g(g_56),.o_h(h_56),.done(rnd_56_done));


wire [63:0] a_57,b_57,c_57,d_57,e_57,f_57,g_57,h_57;
wire rnd_57_done;
round r_57(.clk(clk),.n_rst(n_rst),.start(rnd_56_done),
.a(a_56),.b(b_56),.c(c_56),.d(d_56),.e(e_56),.f(f_56),.g(g_56),.h(h_56),
.W(w_57),.K(Ks[1471:1408]),
.o_a(a_57),.o_b(b_57),.o_c(c_57),.o_d(d_57),.o_e(e_57),.o_f(f_57),.o_g(g_57),.o_h(h_57),.done(rnd_57_done));


wire [63:0] a_58,b_58,c_58,d_58,e_58,f_58,g_58,h_58;
wire rnd_58_done;
round r_58(.clk(clk),.n_rst(n_rst),.start(rnd_57_done),
.a(a_57),.b(b_57),.c(c_57),.d(d_57),.e(e_57),.f(f_57),.g(g_57),.h(h_57),
.W(w_58),.K(Ks[1407:1344]),
.o_a(a_58),.o_b(b_58),.o_c(c_58),.o_d(d_58),.o_e(e_58),.o_f(f_58),.o_g(g_58),.o_h(h_58),.done(rnd_58_done));


wire [63:0] a_59,b_59,c_59,d_59,e_59,f_59,g_59,h_59;
wire rnd_59_done;
round r_59(.clk(clk),.n_rst(n_rst),.start(rnd_58_done),
.a(a_58),.b(b_58),.c(c_58),.d(d_58),.e(e_58),.f(f_58),.g(g_58),.h(h_58),
.W(w_59),.K(Ks[1343:1280]),
.o_a(a_59),.o_b(b_59),.o_c(c_59),.o_d(d_59),.o_e(e_59),.o_f(f_59),.o_g(g_59),.o_h(h_59),.done(rnd_59_done));


wire [63:0] a_60,b_60,c_60,d_60,e_60,f_60,g_60,h_60;
wire rnd_60_done;
round r_60(.clk(clk),.n_rst(n_rst),.start(rnd_59_done),
.a(a_59),.b(b_59),.c(c_59),.d(d_59),.e(e_59),.f(f_59),.g(g_59),.h(h_59),
.W(w_60),.K(Ks[1279:1216]),
.o_a(a_60),.o_b(b_60),.o_c(c_60),.o_d(d_60),.o_e(e_60),.o_f(f_60),.o_g(g_60),.o_h(h_60),.done(rnd_60_done));


wire [63:0] a_61,b_61,c_61,d_61,e_61,f_61,g_61,h_61;
wire rnd_61_done;
round r_61(.clk(clk),.n_rst(n_rst),.start(rnd_60_done),
.a(a_60),.b(b_60),.c(c_60),.d(d_60),.e(e_60),.f(f_60),.g(g_60),.h(h_60),
.W(w_61),.K(Ks[1215:1152]),
.o_a(a_61),.o_b(b_61),.o_c(c_61),.o_d(d_61),.o_e(e_61),.o_f(f_61),.o_g(g_61),.o_h(h_61),.done(rnd_61_done));


wire [63:0] a_62,b_62,c_62,d_62,e_62,f_62,g_62,h_62;
wire rnd_62_done;
round r_62(.clk(clk),.n_rst(n_rst),.start(rnd_61_done),
.a(a_61),.b(b_61),.c(c_61),.d(d_61),.e(e_61),.f(f_61),.g(g_61),.h(h_61),
.W(w_62),.K(Ks[1151:1088]),
.o_a(a_62),.o_b(b_62),.o_c(c_62),.o_d(d_62),.o_e(e_62),.o_f(f_62),.o_g(g_62),.o_h(h_62),.done(rnd_62_done));


wire [63:0] a_63,b_63,c_63,d_63,e_63,f_63,g_63,h_63;
wire rnd_63_done;
round r_63(.clk(clk),.n_rst(n_rst),.start(rnd_62_done),
.a(a_62),.b(b_62),.c(c_62),.d(d_62),.e(e_62),.f(f_62),.g(g_62),.h(h_62),
.W(w_63),.K(Ks[1087:1024]),
.o_a(a_63),.o_b(b_63),.o_c(c_63),.o_d(d_63),.o_e(e_63),.o_f(f_63),.o_g(g_63),.o_h(h_63),.done(rnd_63_done));


wire [63:0] a_64,b_64,c_64,d_64,e_64,f_64,g_64,h_64;
wire rnd_64_done;
round r_64(.clk(clk),.n_rst(n_rst),.start(rnd_63_done),
.a(a_63),.b(b_63),.c(c_63),.d(d_63),.e(e_63),.f(f_63),.g(g_63),.h(h_63),
.W(w_64),.K(Ks[1023:960]),
.o_a(a_64),.o_b(b_64),.o_c(c_64),.o_d(d_64),.o_e(e_64),.o_f(f_64),.o_g(g_64),.o_h(h_64),.done(rnd_64_done));


wire [63:0] a_65,b_65,c_65,d_65,e_65,f_65,g_65,h_65;
wire rnd_65_done;
round r_65(.clk(clk),.n_rst(n_rst),.start(rnd_64_done),
.a(a_64),.b(b_64),.c(c_64),.d(d_64),.e(e_64),.f(f_64),.g(g_64),.h(h_64),
.W(w_65),.K(Ks[959:896]),
.o_a(a_65),.o_b(b_65),.o_c(c_65),.o_d(d_65),.o_e(e_65),.o_f(f_65),.o_g(g_65),.o_h(h_65),.done(rnd_65_done));


wire [63:0] a_66,b_66,c_66,d_66,e_66,f_66,g_66,h_66;
wire rnd_66_done;
round r_66(.clk(clk),.n_rst(n_rst),.start(rnd_65_done),
.a(a_65),.b(b_65),.c(c_65),.d(d_65),.e(e_65),.f(f_65),.g(g_65),.h(h_65),
.W(w_66),.K(Ks[895:832]),
.o_a(a_66),.o_b(b_66),.o_c(c_66),.o_d(d_66),.o_e(e_66),.o_f(f_66),.o_g(g_66),.o_h(h_66),.done(rnd_66_done));


wire [63:0] a_67,b_67,c_67,d_67,e_67,f_67,g_67,h_67;
wire rnd_67_done;
round r_67(.clk(clk),.n_rst(n_rst),.start(rnd_66_done),
.a(a_66),.b(b_66),.c(c_66),.d(d_66),.e(e_66),.f(f_66),.g(g_66),.h(h_66),
.W(w_67),.K(Ks[831:768]),
.o_a(a_67),.o_b(b_67),.o_c(c_67),.o_d(d_67),.o_e(e_67),.o_f(f_67),.o_g(g_67),.o_h(h_67),.done(rnd_67_done));


wire [63:0] a_68,b_68,c_68,d_68,e_68,f_68,g_68,h_68;
wire rnd_68_done;
round r_68(.clk(clk),.n_rst(n_rst),.start(rnd_67_done),
.a(a_67),.b(b_67),.c(c_67),.d(d_67),.e(e_67),.f(f_67),.g(g_67),.h(h_67),
.W(w_68),.K(Ks[767:704]),
.o_a(a_68),.o_b(b_68),.o_c(c_68),.o_d(d_68),.o_e(e_68),.o_f(f_68),.o_g(g_68),.o_h(h_68),.done(rnd_68_done));


wire [63:0] a_69,b_69,c_69,d_69,e_69,f_69,g_69,h_69;
wire rnd_69_done;
round r_69(.clk(clk),.n_rst(n_rst),.start(rnd_68_done),
.a(a_68),.b(b_68),.c(c_68),.d(d_68),.e(e_68),.f(f_68),.g(g_68),.h(h_68),
.W(w_69),.K(Ks[703:640]),
.o_a(a_69),.o_b(b_69),.o_c(c_69),.o_d(d_69),.o_e(e_69),.o_f(f_69),.o_g(g_69),.o_h(h_69),.done(rnd_69_done));


wire [63:0] a_70,b_70,c_70,d_70,e_70,f_70,g_70,h_70;
wire rnd_70_done;
round r_70(.clk(clk),.n_rst(n_rst),.start(rnd_69_done),
.a(a_69),.b(b_69),.c(c_69),.d(d_69),.e(e_69),.f(f_69),.g(g_69),.h(h_69),
.W(w_70),.K(Ks[639:576]),
.o_a(a_70),.o_b(b_70),.o_c(c_70),.o_d(d_70),.o_e(e_70),.o_f(f_70),.o_g(g_70),.o_h(h_70),.done(rnd_70_done));


wire [63:0] a_71,b_71,c_71,d_71,e_71,f_71,g_71,h_71;
wire rnd_71_done;
round r_71(.clk(clk),.n_rst(n_rst),.start(rnd_70_done),
.a(a_70),.b(b_70),.c(c_70),.d(d_70),.e(e_70),.f(f_70),.g(g_70),.h(h_70),
.W(w_71),.K(Ks[575:512]),
.o_a(a_71),.o_b(b_71),.o_c(c_71),.o_d(d_71),.o_e(e_71),.o_f(f_71),.o_g(g_71),.o_h(h_71),.done(rnd_71_done));


wire [63:0] a_72,b_72,c_72,d_72,e_72,f_72,g_72,h_72;
wire rnd_72_done;
round r_72(.clk(clk),.n_rst(n_rst),.start(rnd_71_done),
.a(a_71),.b(b_71),.c(c_71),.d(d_71),.e(e_71),.f(f_71),.g(g_71),.h(h_71),
.W(w_72),.K(Ks[511:448]),
.o_a(a_72),.o_b(b_72),.o_c(c_72),.o_d(d_72),.o_e(e_72),.o_f(f_72),.o_g(g_72),.o_h(h_72),.done(rnd_72_done));


wire [63:0] a_73,b_73,c_73,d_73,e_73,f_73,g_73,h_73;
wire rnd_73_done;
round r_73(.clk(clk),.n_rst(n_rst),.start(rnd_72_done),
.a(a_72),.b(b_72),.c(c_72),.d(d_72),.e(e_72),.f(f_72),.g(g_72),.h(h_72),
.W(w_73),.K(Ks[447:384]),
.o_a(a_73),.o_b(b_73),.o_c(c_73),.o_d(d_73),.o_e(e_73),.o_f(f_73),.o_g(g_73),.o_h(h_73),.done(rnd_73_done));


wire [63:0] a_74,b_74,c_74,d_74,e_74,f_74,g_74,h_74;
wire rnd_74_done;
round r_74(.clk(clk),.n_rst(n_rst),.start(rnd_73_done),
.a(a_73),.b(b_73),.c(c_73),.d(d_73),.e(e_73),.f(f_73),.g(g_73),.h(h_73),
.W(w_74),.K(Ks[383:320]),
.o_a(a_74),.o_b(b_74),.o_c(c_74),.o_d(d_74),.o_e(e_74),.o_f(f_74),.o_g(g_74),.o_h(h_74),.done(rnd_74_done));


wire [63:0] a_75,b_75,c_75,d_75,e_75,f_75,g_75,h_75;
wire rnd_75_done;
round r_75(.clk(clk),.n_rst(n_rst),.start(rnd_74_done),
.a(a_74),.b(b_74),.c(c_74),.d(d_74),.e(e_74),.f(f_74),.g(g_74),.h(h_74),
.W(w_75),.K(Ks[319:256]),
.o_a(a_75),.o_b(b_75),.o_c(c_75),.o_d(d_75),.o_e(e_75),.o_f(f_75),.o_g(g_75),.o_h(h_75),.done(rnd_75_done));


wire [63:0] a_76,b_76,c_76,d_76,e_76,f_76,g_76,h_76;
wire rnd_76_done;
round r_76(.clk(clk),.n_rst(n_rst),.start(rnd_75_done),
.a(a_75),.b(b_75),.c(c_75),.d(d_75),.e(e_75),.f(f_75),.g(g_75),.h(h_75),
.W(w_76),.K(Ks[255:192]),
.o_a(a_76),.o_b(b_76),.o_c(c_76),.o_d(d_76),.o_e(e_76),.o_f(f_76),.o_g(g_76),.o_h(h_76),.done(rnd_76_done));


wire [63:0] a_77,b_77,c_77,d_77,e_77,f_77,g_77,h_77;
wire rnd_77_done;
round r_77(.clk(clk),.n_rst(n_rst),.start(rnd_76_done),
.a(a_76),.b(b_76),.c(c_76),.d(d_76),.e(e_76),.f(f_76),.g(g_76),.h(h_76),
.W(w_77),.K(Ks[191:128]),
.o_a(a_77),.o_b(b_77),.o_c(c_77),.o_d(d_77),.o_e(e_77),.o_f(f_77),.o_g(g_77),.o_h(h_77),.done(rnd_77_done));


wire [63:0] a_78,b_78,c_78,d_78,e_78,f_78,g_78,h_78;
wire rnd_78_done;
round r_78(.clk(clk),.n_rst(n_rst),.start(rnd_77_done),
.a(a_77),.b(b_77),.c(c_77),.d(d_77),.e(e_77),.f(f_77),.g(g_77),.h(h_77),
.W(w_78),.K(Ks[127:64]),
.o_a(a_78),.o_b(b_78),.o_c(c_78),.o_d(d_78),.o_e(e_78),.o_f(f_78),.o_g(g_78),.o_h(h_78),.done(rnd_78_done));


wire [63:0] a_79,b_79,c_79,d_79,e_79,f_79,g_79,h_79;
wire rnd_79_done;
round r_79(.clk(clk),.n_rst(n_rst),.start(rnd_78_done),
.a(a_78),.b(b_78),.c(c_78),.d(d_78),.e(e_78),.f(f_78),.g(g_78),.h(h_78),
.W(w_79),.K(Ks[63:0]),
.o_a(a_79),.o_b(b_79),.o_c(c_79),.o_d(d_79),.o_e(e_79),.o_f(f_79),.o_g(g_79),.o_h(h_79),.done(rnd_79_done));
 







 always@(posedge clk, negedge n_rst)
 begin 
    if(~n_rst)
    begin 
        o_a <= 'b0;
        o_b <= 'b0;
        o_c <= 'b0;
        o_d <= 'b0;
        o_e <= 'b0;
        o_f <= 'b0;
        o_g <= 'b0;
        o_h <= 'b0; 
        done <= 'b0; 
    end 
    else 
    begin
        o_a <= a_79 + a;
        o_b <= b_79 + b;
        o_c <= c_79 + c;
        o_d <= d_79 + d;
        o_e <= e_79 + e;
        o_f <= f_79 + f;
        o_g <= g_79 + g;
        o_h <= h_79 + h;
        done <= rnd_79_done;
    end  
 end 


endmodule
