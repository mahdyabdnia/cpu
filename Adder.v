module Adder(clk,in,imm,out)
input clk;
input [0:63] in;
input [0:63]imm;
output reg[0:63] out;


assign imm=64'b100
always @(negedge clk)
begin 

out=in + imm;
end
endmodule
