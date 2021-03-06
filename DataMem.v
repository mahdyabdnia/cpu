module DataMem(clk,mem_wr,mem_re,address,wr_data,re_data);
input mem_wr;
input mem_re;
input clk;
input [63:0]address;
input [63:0]wr_data;
output reg  [63:0]re_data;
reg [63:0]mem[0:255];



always@(negedge clk)
begin 

if(mem_wr==1)
mem[address]<=wr_data;

if(mem_re==1)
re_data<=mem[address];


end
endmodule 
