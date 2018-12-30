module pipRegister #(parameter n=64)(clk,in,out);

input clk;

input [n-1:0]in;
output reg [n-1:0]out;

always @(negedge clk)


out<=in;
endmodule
