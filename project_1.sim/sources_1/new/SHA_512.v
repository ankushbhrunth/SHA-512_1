`timescale 1ns / 1ps
 
module SHA_512 #(L=1500)(
input clk, n_rst, start_hash,
input [L-1:0] message,
output reg [63:0] o_a,o_b,o_c,o_d,o_e,o_f,o_g,o_h,
output reg done
);

reg start;  
localparam s = (L+(1024-L%1024)); 
localparam m_num = s/1024;
wire [s-1:0] padded_message ;   
 message_block #(.L(L),.s(s)) messege_pad (
     clk, n_rst, message, padded_message );
        
wire [63:0] init_a = 64'h6a09e667f3bcc908;
wire [63:0] init_b = 64'hbb67ae8584caa73b;
wire [63:0] init_c = 64'h3c6ef372fe94f82b;
wire [63:0] init_d = 64'ha54ff53a5f1d36f1;
wire [63:0] init_e = 64'h510e527fade682d1;
wire [63:0] init_f = 64'h9b05688c2b3e6c1f;
wire [63:0] init_g = 64'h1f83d9abfb41bd6b;
wire [63:0] init_h = 64'h5be0cd19137e2179;
 
genvar i;
generate
    for (i = 0; i < m_num; i = i + 1) begin : Compr_funct
        wire [63:0] a,b,c,d,e,f,g,h;
        wire done_compr; 
        if(i == 0)
        begin  
            Compression_function   U (
            .clk(clk), .n_rst(n_rst), .start(start),
            .M(padded_message[(s-1)-1024*i:(s-1024)-1024*i]),
            .a(init_a),.b(init_b),.c(init_c),.d(init_d),.e(init_e),.f(init_f),.g(init_g),.h(init_h),
            .o_a(a),.o_b(b),.o_c(c),.o_d(d),.o_e(e),.o_f(f),.o_g(g),.o_h(h),.done(done_compr));    
        end  
        else 
        begin 
            Compression_function   U (
            .clk(clk), .n_rst(n_rst), .start(Compr_funct[i-1].done_compr),
            .M(padded_message[(s-1)-1024*i:(s-1024)-1024*i]),
            .a(Compr_funct[i-1].a),.b(Compr_funct[i-1].b),.c(Compr_funct[i-1].c),.d(Compr_funct[i-1].d),.e(Compr_funct[i-1].e),.f(Compr_funct[i-1].f),.g(Compr_funct[i-1].g),.h(Compr_funct[i-1].h),
            .o_a(a),.o_b(b),.o_c(c),.o_d(d),.o_e(e),.o_f(f),.o_g(g),.o_h(h),.done(done_compr));
              
        end 
    end
endgenerate

  always @ (posedge clk , negedge n_rst)
begin
    if (~n_rst)
    begin  
        o_a <= 'b0;
        o_b <= 'b0;
        o_c <= 'b0;
        o_d <= 'b0;
        o_e <= 'b0;
        o_f <= 'b0; 
        o_g <= 'b0;
        o_h <= 'b0; 
        start <= 'b0;
    end
    else  
    begin
    
        o_a <= Compr_funct[m_num-1].a ;
        o_b <= Compr_funct[m_num-1].b ;
        o_c <= Compr_funct[m_num-1].c ;
        o_d <= Compr_funct[m_num-1].d ;
        o_e <= Compr_funct[m_num-1].e ;
        o_f <= Compr_funct[m_num-1].f ;
        o_g <= Compr_funct[m_num-1].g ;
        o_h <= Compr_funct[m_num-1].h ;
        if(start_hash) start <= 1 ; 
        done <= Compr_funct[m_num-1].done_compr;  
    end
end
endmodule 
