module AluControl( AluOp,opcode,AluCn);
input [10:0]opcode;
input [1:0]AluOp;
output reg [3:0]AluCn;

always @(opcode,AluOp)
begin
if(AluOp[1]==0)
begin
 if(AluOp[0]==0)
   begin
     AluCn<=4'b10; //ldur,stur
   end
 else
   begin
     AluCn<=4'b0111;//Cbz

   end


end


else
 begin

   if(opcode==11'b10001011000)
     begin
       AluCn<=4'b10;//Add
     end
   
   else if(opcode==11'b11001011000)
      begin
      AluCn<=4'b110;//sub
      end
     
      else if(opcode==11'b10001010000)
      begin
      AluCn<=4'b0;//and
      end
      else
        begin
          AluCn<=4'b1;//or
        end
      
       
     end

end

endmodule
