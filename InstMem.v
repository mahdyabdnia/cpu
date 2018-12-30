module InstMem(clk,adrs,re_acc,inst);

output reg [63:0]inst;
input [63:0]adrs;
input re_acc;
input clk;
reg [63:0]mem[255:0];


always@(negedge clk)
begin 
if(re_acc==1'b1)
 
inst<=mem[adrs];
end
endmodule
