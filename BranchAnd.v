module BranchAnd(zr,br,pcSrc);
input zr;
input br;
output reg pcSrc;
always @(zr,br)
begin 

pcSrc=br&zr;

end

endmodule
