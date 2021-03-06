module control(instruction,reg2loc,br,MemRead,MemToReg,ALUOp,MemWrite,ALUsrc,RegWrite);
input [10:0]instruction;
output reg reg2loc;
output reg br;
output reg  MemRead;
output reg  MemToReg;
output  reg [1:0]ALUOp;
output  reg MemWrite;
output reg  ALUsrc;
output  reg RegWrite;






always@(instruction)
begin 
if(instruction==11'b11111000000)
  
    {reg2loc,ALUsrc,MemToReg,RegWrite,MemRead,MemWrite,br,ALUOp}<=9'b011110000;//ldur
  
else if(instruction==11'b11111000010)
  
     {reg2loc,ALUsrc,MemToReg,RegWrite,MemRead,MemWrite,br,ALUOp}<=9'b110001000;//stur
  
else if(instruction[10:3]==11'b10110100)
     
      {reg2loc,ALUsrc,MemToReg,RegWrite,MemRead,MemWrite,br,ALUOp}<=9'b100000101;//cbz
    
else 
  
      {reg2loc,ALUsrc,MemToReg,RegWrite,MemRead,MemWrite,br,ALUOp}<=9'b000100010;//Rtype
 end
endmodule
