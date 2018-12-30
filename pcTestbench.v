module pcTestbench();
wire clk;
wire reset;
wire wr;
wire imm;
reg count;

clock dut(.clk(clk));
Adder dut2(.imm(imm),.count(count),.wr(wr));
pc dut3(.clk(clk),.reset(reset),.wr(wr),.count(count));






endmodule
