module Adder(in,imm,out)
input [0:63] in;
input [0:63]imm;
output reg[0:63] out;


assign imm=64'b100
always @(in)
begin 

out=in + imm;
end
endmodule
