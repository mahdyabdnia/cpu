module shift2Left(insin,insout);
input [0:63]insin;
output [0:63]insout;
assign insout=insin<<2;
endmodule
