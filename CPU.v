module Cpu();

wire clk;

wire pc_reset;
wire pc_wirte_access;
wire [63:0]pc_Mux_wrte;
wire [63:0]insruction_address;//pc //pc counter //the address for instruction memory

wire [63:0]adder1_count;//adder1

wire InsMemAccess;
wire [63:0]instruction;//insruction

wire [4:0]read_reg1;
wire [4:0]read_Mux_reg2;
wire [4:0]write_Mux_reg;
wire [63:0] reg_read_data1;
wire [63:0] reg_Mux_read_data2;
wire [63:0] reg_Mux_write_data;
wire reg_write;//register file

wire [63:0]sign_extend_offset;//instruction[31:0] input

wire Reg2Loc,ALUSrc,Branch,MemRead,MemWrite,RegWrite,MemToReg;
wire [1:0]ALUOp;//Control unit //input instruction [31:21]




wire [63:0]Alu_input1;
wire [63:0]Alu_Mux_input2;
wire [3:0]Alu_Control_op;
wire zero;
wire [63:0]Alu_output;//Alu



wire [63:0]adr2shift_ofset;//input sign Adder2
wire [63:0]branch_adder_count;//Adder2

wire [63:0]MemAddres;
wire [63:0]mem_read_data;
wire [63:0]mem_write_data;

wire pcSrc;//And unit input Branch,zero

wire [95:0]IF_ID; //IFID register
wire [279:0]ID_EX;
wire [202:0]EX_MEM;
wire [134:0]MEM_WB;
wire [63:0]old_instruction_address;
wire [63:0]pc_mux;

clock Clock(.clk);

ALU immAdder (.input1(old_instruction_address),.input2(64'b100),.Aluopt(4'b0010),.Zr(),.out(adder1_count));

mux2to1 #(.n(5)) Mux0 (.inA(adder_count),.inB(EX_MEM[197:134]),.select(pcSrc),.out(pc_mux));

pc PC (.clk,.reset(1'b0),.wr(1'b1),.w(pc_mux),.counter(instruction_address));

InstMem Instruction_Memory (.clk,.adrs(instruction_address),.re_acc(1'b1),.inst(instruction));

pipRegister  #(.n(96))IFID(.clk,.in({instruction_addess,instruction[31:0]}),.out(IF_ID));

control Control(.instruction(IF_ID[31:21]),.reg2loc(Reg2Loc),.br(Branch),.MemRead(MemRead),.MemToReg(MemToReg),.ALUOp(ALUOp),.MemWrite(MemWrite),.ALUsrc(ALUSrc),.RegWrite(RegWrite));

mux2to1 #(.n(5))Mux(.inA(IF_ID[20:16]),.inB(IF_ID[4:0]),.select(Reg2Loc),.out(read_Mux_reg2));

register Register (.data_a(reg_read_data1),.data_b(reg_Mux_read_data2),.Ad_a(IF_ID[9:5]),.Ad_b(read_Mux_reg2),.Ad_c(MEM_WB[4:0]),.clk,.data_wr(reg_Mux_write_data),.wr_acc(MEM_WB[134]));

signextend SignExtend(.ininst(IF_ID[31:0]),.aluop(ALUOp),.out(sign_extend_offset));

pipRegister #(.n(280)) IDEX(.clk,.in({RegWrite,MemToReg,Branch,MemWrite,MemRead,ALUSrc,ALUOp,IF_ID[95:32],reg_read_data1,reg_Mux_read_data2,sign_extend_offset,IF_ID[31:0],IF_ID[31:21],IF_ID[4:0]}),.out(ID_EX));//wb[279;278]//me[277;275]//ex[274;272]//pc [271;208],data1[207;176],data2[175,112],offset[111;48],instruction[47;16],[15;5],[4;0]

mux2to1 #(.n(64))Mux2(.inA(ID_EX[175:112]),.inB(ID_EX[111:48]),.select(ID_EX[274]),.out(ALU_Mux_input2));

AluControl aluControl (.AluOp(ID_EX[273:272]),.opcode(ID_EX[15:5]),.AluCn(Alu_Control_op));

shift2Left Shift(.insin(ID_EX[111:48]),.insout(adr2shift_ofset));

ALU alu (.input1(ID_EX[207:176]),.inpu2(ALU_Mux_reg2),.Aluopt(Alu_Control_op),.Zr(zero),.out(Alu_output));

AlU condAdder(.input1(ID_EX[271:208]),.input2(adr2shift_ofset),.Aluopt(4'b0010),.Zr(),.out(branch_adder_count));//adder2

pipRegister #(.n(203)) EXMEM (.clk,.in({ID_EX[279:278],ID_EX[277:275],branch_adder_count,zero,Alu_output,ID_EX[175:112],ID_EX[4:0]}),.out(EX_MEM));//wb[202;201]//mem[200;198]//br[197;134]//zero[133]//aluou[132;69]//[68;5]//[4:0}

BranchAnd branchAnd(.zr(EX_MEM[133]),.br(EX_MEM[200]),.pcSrc(pcSrc));

DataMem DataMemory(.clk,.mem_wr(EX_MEM[199]),.mem_re(EX_MEM[198]),.address(EX_MEM[132:69]),.wr_data(EX_MEM[68:5]),.re_data(mem_read_data));

pipRegister #(.n(135)) MEMWB(.clk,.in({EX_MEM[202:201],mem_read_data,EX_MEM[132:69],EX_MEM[4:0]}),.out(MEM_WB));//[134;133]wb//[132;69]mem_red_data//[68;5]aluresult//[4;0]write register

mux2to1 #(.n(64))Mux3(.inA(MEM_WB[132:69]),.inB(MEM_WB[68:5]),.out(reg_Mux_write_data));

endmodule
