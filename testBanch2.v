module testBench();
reg [0:4] Ad_a,Ad_b,Ad_c;
reg [0:63] data_wr;
wire [0:63] data_a,data_b;
reg wr_acc;
wire clk;
clock clok(.clk(clk));



register dut (.clk(clk),.Ad_a(Ad_a),.Ad_b(Ad_b),.Ad_c(Ad_c),.data_wr(data_wr),.wr_acc(wr_acc),.data_a(data_a),.data_b(data_b));

initial begin
#100;
 Ad_a <=4'b0000;
Ad_b <=4'b0000;
Ad_c <=4'b0001;
wr_acc <=1'b1;
data_wr <=64'b0000000000000000000000000000000000000000000000000000000000000001;
#100;
 Ad_a <=4'b0000;
Ad_b <=4'b0000;
Ad_c <=4'b0001;
wr_acc <=1'b0;
data_wr <=64'b0000000000000000000000000000000000000000000000000000000000000001;

#100;
 Ad_a <=4'b0000;
Ad_b <=4'b0000;
Ad_c <=4'b0000;
wr_acc <=1'b1;
data_wr <=64'b0000000000000000000000000000000000000000000000000000000000000001;
#100;
 Ad_a <=4'b0000;
Ad_b <=4'b0000;
Ad_c <=4'b0000;
wr_acc <=1'b0;
data_wr <=64'b0000000000000000000000000000000000000000000000000000000000000001;



end
endmodule
