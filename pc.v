module pc(clk,reset,wr,counter)
input clk;
input reset;
input [0:63]wr;
output reg [0:63]counter;






always @(negedge clk)
begin 

if(posedge reset)
begin 

counter<=counter+0;

end

else
begin 
counter<=counter+wr;

end
















else







endmodule
