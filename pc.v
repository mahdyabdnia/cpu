module pc(clk,reset,w,wr,counter)
input clk,w;
input reset;
input [0:63]wr;
output reg [0:63]counter;






always @(negedge clk)
begin 

	if(posedge reset)
		begin 

			counter<=0;

		end

		else if (w=1)
		begin 
			counter<=wr;

		end
















else







endmodule
