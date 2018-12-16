module InstMem(addr,clk,re_acc,inst)
input [0:63]addr;
output reg [0:31]inst;
reg [0:63]mem[255:0];
input re_acc;
input clk;

always@(negedge clk)
begin 
if(re_acc=1'b1)
begin 
inst<=mem[addr];





end
end






endmodule
