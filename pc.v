module pc(clk,reset,wr,w,counter);
input clk;
input reset;
input w;
input [63:0]wr;
output reg [63:0]counter;
always @(negedge clk)
begin 

if( reset==1)
 counter<=0;

else if(w==1)
counter<=wr;
end
endmodule
