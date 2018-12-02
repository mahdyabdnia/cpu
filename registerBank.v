module register(data_a,data_b,Ad_a,Ad_b,Ad_c,clk,data_wr,wr_acc,);
 output [0:63]data_a,data_b;
input [0:4]Ad_a,Ad_b,Ad_c;
input clk;
input [0:63]data_wr;
input wr_acc;
reg [63:0] mem [0:31];



assign  #2 data_a = mem[Ad_a];
assign  #2 data_b = mem[Ad_b];

always @(negedge clk)
begin
if(wr_acc)
if(data_wr !=4'd31)
mem[Ad_c]<= #3 data_wr;
else 
mem[0] <= #3 'd0;
end 
endmodule 


