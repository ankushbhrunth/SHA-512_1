`timescale 1ns / 1ps
 

module message_schedule(input [1023:0] M, 

output [63:0] w_0,w_1,w_2,w_3,w_4,w_5,
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
              w_77,w_78,w_79
    );
  

function automatic [63:0] rho0;
    input [63:0] x;
//    if(^x === 1'bX) rho0 = 32'h888;
//    else 
    rho0 = {x[0],x[63:1]} ^ {x[7:0],x[63:8]} ^ (x >> 7);
endfunction


function automatic [63:0] rho1;
    input [63:0] x;
//   / if(^x === 1'bX) rho1 = 32'h888;
//    else 
    rho1 = {x[18:0],x[63:19]} ^ {x[60:0],x[63:61]} ^ (x >> 6);
endfunction

  
//assign w_0 = M[63:0];  //least sig
//assign w_1 = M[127:64];
//assign w_2 = M[191:128];
//assign w_3 = M[255:192];
//assign w_4 = M[319:256];
//assign w_5 = M[383:320];
//assign w_6 = M[447:384];
//assign w_7 = M[511:448];
//assign w_8 = M[575:512];
//assign w_9 = M[639:576];
//assign w_10 = M[703:640];
//assign w_11 = M[767:704];
//assign w_12 = M[831:768];
//assign w_13 = M[895:832];
//assign w_14 = M[959:896];
//assign w_15 = M[1023:960];

assign w_15 = M[63:0];  //least sig
assign w_14 = M[127:64];
assign w_13 = M[191:128];
assign w_12 = M[255:192];
assign w_11 = M[319:256];
assign w_10 = M[383:320];
assign w_9 = M[447:384];
assign w_8 = M[511:448];
assign w_7 = M[575:512];
assign w_6 = M[639:576];
assign w_5 = M[703:640];
assign w_4 = M[767:704];
assign w_3 = M[831:768];
assign w_2 = M[895:832];
assign w_1 = M[959:896];
assign w_0 = M[1023:960];

assign w_16 = rho1(w_14) + w_9 + rho0(w_1) + w_0;
assign w_17 = rho1(w_15) + w_10 + rho0(w_2) + w_1;
assign w_18 = rho1(w_16) + w_11 + rho0(w_3) + w_2;
assign w_19 = rho1(w_17) + w_12 + rho0(w_4) + w_3;
assign w_20 = rho1(w_18) + w_13 + rho0(w_5) + w_4;
assign w_21 = rho1(w_19) + w_14 + rho0(w_6) + w_5;
assign w_22 = rho1(w_20) + w_15 + rho0(w_7) + w_6;
assign w_23 = rho1(w_21) + w_16 + rho0(w_8) + w_7;
assign w_24 = rho1(w_22) + w_17 + rho0(w_9) + w_8;
assign w_25 = rho1(w_23) + w_18 + rho0(w_10) + w_9;
assign w_26 = rho1(w_24) + w_19 + rho0(w_11) + w_10;
assign w_27 = rho1(w_25) + w_20 + rho0(w_12) + w_11;
assign w_28 = rho1(w_26) + w_21 + rho0(w_13) + w_12;
assign w_29 = rho1(w_27) + w_22 + rho0(w_14) + w_13;
assign w_30 = rho1(w_28) + w_23 + rho0(w_15) + w_14;
assign w_31 = rho1(w_29) + w_24 + rho0(w_16) + w_15;
assign w_32 = rho1(w_30) + w_25 + rho0(w_17) + w_16;
assign w_33 = rho1(w_31) + w_26 + rho0(w_18) + w_17;
assign w_34 = rho1(w_32) + w_27 + rho0(w_19) + w_18;
assign w_35 = rho1(w_33) + w_28 + rho0(w_20) + w_19;
assign w_36 = rho1(w_34) + w_29 + rho0(w_21) + w_20;
assign w_37 = rho1(w_35) + w_30 + rho0(w_22) + w_21;
assign w_38 = rho1(w_36) + w_31 + rho0(w_23) + w_22;
assign w_39 = rho1(w_37) + w_32 + rho0(w_24) + w_23;
assign w_40 = rho1(w_38) + w_33 + rho0(w_25) + w_24;
assign w_41 = rho1(w_39) + w_34 + rho0(w_26) + w_25;
assign w_42 = rho1(w_40) + w_35 + rho0(w_27) + w_26;
assign w_43 = rho1(w_41) + w_36 + rho0(w_28) + w_27;
assign w_44 = rho1(w_42) + w_37 + rho0(w_29) + w_28;
assign w_45 = rho1(w_43) + w_38 + rho0(w_30) + w_29;
assign w_46 = rho1(w_44) + w_39 + rho0(w_31) + w_30;
assign w_47 = rho1(w_45) + w_40 + rho0(w_32) + w_31;
assign w_48 = rho1(w_46) + w_41 + rho0(w_33) + w_32;
assign w_49 = rho1(w_47) + w_42 + rho0(w_34) + w_33;
assign w_50 = rho1(w_48) + w_43 + rho0(w_35) + w_34;
assign w_51 = rho1(w_49) + w_44 + rho0(w_36) + w_35;
assign w_52 = rho1(w_50) + w_45 + rho0(w_37) + w_36;
assign w_53 = rho1(w_51) + w_46 + rho0(w_38) + w_37;
assign w_54 = rho1(w_52) + w_47 + rho0(w_39) + w_38;
assign w_55 = rho1(w_53) + w_48 + rho0(w_40) + w_39;
assign w_56 = rho1(w_54) + w_49 + rho0(w_41) + w_40;
assign w_57 = rho1(w_55) + w_50 + rho0(w_42) + w_41;
assign w_58 = rho1(w_56) + w_51 + rho0(w_43) + w_42;
assign w_59 = rho1(w_57) + w_52 + rho0(w_44) + w_43;
assign w_60 = rho1(w_58) + w_53 + rho0(w_45) + w_44;
assign w_61 = rho1(w_59) + w_54 + rho0(w_46) + w_45;
assign w_62 = rho1(w_60) + w_55 + rho0(w_47) + w_46;
assign w_63 = rho1(w_61) + w_56 + rho0(w_48) + w_47;
assign w_64 = rho1(w_62) + w_57 + rho0(w_49) + w_48;
assign w_65 = rho1(w_63) + w_58 + rho0(w_50) + w_49;
assign w_66 = rho1(w_64) + w_59 + rho0(w_51) + w_50;
assign w_67 = rho1(w_65) + w_60 + rho0(w_52) + w_51;
assign w_68 = rho1(w_66) + w_61 + rho0(w_53) + w_52;
assign w_69 = rho1(w_67) + w_62 + rho0(w_54) + w_53;
assign w_70 = rho1(w_68) + w_63 + rho0(w_55) + w_54;
assign w_71 = rho1(w_69) + w_64 + rho0(w_56) + w_55;
assign w_72 = rho1(w_70) + w_65 + rho0(w_57) + w_56;
assign w_73 = rho1(w_71) + w_66 + rho0(w_58) + w_57;
assign w_74 = rho1(w_72) + w_67 + rho0(w_59) + w_58;
assign w_75 = rho1(w_73) + w_68 + rho0(w_60) + w_59;
assign w_76 = rho1(w_74) + w_69 + rho0(w_61) + w_60;
assign w_77 = rho1(w_75) + w_70 + rho0(w_62) + w_61;
assign w_78 = rho1(w_76) + w_71 + rho0(w_63) + w_62;
assign w_79 = rho1(w_77) + w_72 + rho0(w_64) + w_63; 
endmodule
