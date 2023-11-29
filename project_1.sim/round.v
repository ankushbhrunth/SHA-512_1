 
module round(input clk,n_rst, start,
input [63:0] a,b,c,d,e,f,g,h,W,K, 
output reg [63:0] o_a,o_b,o_c,o_d,o_e,o_f,o_g,o_h,
output reg done
 );

wire [63:0]sum_E_r,sum_A_r,add1_r,add2_r; 
wire [63:0]maj_r,ch_r;
wire [63:0]add3_r,add4_r,add5_r,add6_r,add7_r;
wire [63:0]T_1,T_2;
assign T_1 = h + sum_E_r + ch_r + K + W; 
assign T_2 = sum_A_r + maj_r  ; 
sum_A inst_1 (.A(a),.r(sum_A_r)) ;
add_mod64 inst_2 (.A(sum_A_r),.B(maj_r),.r(add1_r)) ;
add_mod64 inst_4 (.A(add1_r),.B(add6_r),.r(add2_r)) ;

ma inst_3 (.A(a),.B(b),.C(c),.r(maj_r)) ;
  
ch inst_9 (.E(e),.F(f),.G(g),.r(ch_r)) ;
sum_E inst_10 (.E(e),.r(sum_E_r)) ;
 
add_mod64 inst_5 (.A(h),.B(ch_r),.r(add3_r)) ;
add_mod64 inst_6 (.A(add3_r),.B(sum_E_r),.r(add4_r)) ;
add_mod64 inst_7 (.A(add4_r),.B(W),.r(add5_r)) ;
add_mod64 inst_8 (.A(add5_r),.B(K),.r(add6_r)) ;

add_mod64 inst_11 (.A(add6_r),.B(d),.r(add7_r)) ;
 
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
        o_a <= add2_r;
        o_b <= a;
        o_c <= b;
        o_d <= c;
        o_e <= add7_r;
        o_f <= e;
        o_g <= f;
        o_h <= g;
        done <= start;
    end  
 end 

endmodule
