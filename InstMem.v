module InstMem(addr,inst)
input [0:31]addr;
output reg [0:31]inst;
reg [0;31]mem[255:0];
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
