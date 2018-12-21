module signextend(ininst,outinst);
input [0:31]ininst;
output  [0:63]outinst;

assign outinst={{32{ininst[0]}},ininst};





endmodule 
