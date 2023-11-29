`timescale 1ns / 1ps
// interface : clock and n_rst 
//             message with width L provided from upper level
//             padded_message with width S provided from upper level which should be s = L+(1024-L%1024);
module message_block #(L=480,s=232)(
    input clk, n_rst,
    input [L-1:0] message, 
    output reg [s-1:0] padded_message 
    ); 
// m is the number of zeros used to pad 
localparam m = s-L-1-128;     
always @(posedge clk,posedge n_rst) begin
    if(~n_rst)begin 
        padded_message <= 'h0;  
    end 
    else
    begin         
            // in the algorithm the L sould be in range of 2^128 
            // which is very big and can not be implemented in verilog 
            // if we need to make it variable, as any parameter will be 
            // integer with range 2^31 max so in the least significant part
            // we put 96bit of zeros and L which is 32 bits so the sum is 128 of the algorithm
            padded_message <= {message,1'b1,{m{1'b0}},96'b0,L};   
 
    end 
end
endmodule
