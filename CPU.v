module Cpu();

wire clk;
wire pc_reset;
wire pc_wirte_access;
wire pc_wrte
wire pc_counter;
wire [63:0]instruction;
wire [4:0]read_reg1;
wire [4:0]read_reg2;
wire [4:0]write_reg;
wire [63:0] reg_read_data1
wire [63:0] reg_read_data2;
wire [63:0] reg_write_data;
wire reg_write;
wire [63:0]adr_ofset;
wire [63:0]adr2shift_ofset;
wire [63:0]Alu_input1;
wire [63:0]Alu_input2;
wire [3:0]Alu_Control_op;


endmodule
