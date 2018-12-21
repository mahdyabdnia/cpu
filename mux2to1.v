module mux2to1(inA,inB,select,out);
input [0:63]inA;
input [0:63]inB;
input select;
output reg [0:63]out;

always@(inA,inB,select)
begin
if(select==1'b0)
  out<=inA;
else 
  out<=inB;



end









endmodule
