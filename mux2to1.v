module mux2to1 #(parameter n=64)(inA,inB,select,out);
input [n-1:0]inA;
input [n-1:0]inB;
input select;
output reg [n-1:0]out;

always@(inA,inB,select)
begin
if(select==1'b0)
  out<=inA;
else 
  out<=inB;



end









endmodule
