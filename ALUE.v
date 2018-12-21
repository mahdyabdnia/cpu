module ALU( input1,input2,Aluopt,Zr,out);
input [0:63]input1;
input [0:63]input2;
input[0:3]Aluopt;
output Zr;
output reg [0:63] out;

assign Zr=out?0:1;
always @(input1,input2,Aluopt)
begin
if(Aluopt==4'b0010)
  out<=input1+input2;
else if(Aluopt==4'b0111)
  out<=input2;
else if(Aluopt==4'b0110)
  out<=input2-input1;
else if(Aluopt==4'b0000)
  out<=input1&input2;
else 
  out<=input1|input2;





end
endmodule
