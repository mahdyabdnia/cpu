module InstMem(adrs,clk,re_acc,inst);

output reg [0:63]inst;
input [0:63]adrs;
input re_acc;
input clk;
reg [0:63]mem[255:0];


always@(negedge clk)
begin 
if(re_acc==1'b1)
 
inst<=mem[adrs];
end
endmodule
