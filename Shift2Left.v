module shift2Left(insin,insout);
input [63:0]insin;
output [63:0]insout;
assign insout={insin[61:0],2'b00};
endmodule
