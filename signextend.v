module signextend(ininst,aluop,outinst);
input [31:0]ininst;
input [0:1] aluop;
output reg [63:0]outinst;

always @(aluop,ininst)
begin

if(aluop==2'b00)
  outinst={{55{ininst[11]}},ininst[20:12]};
else
   outinst={{45{ininst[8]}},ininst[23:5]};                                               






end
endmodule 
