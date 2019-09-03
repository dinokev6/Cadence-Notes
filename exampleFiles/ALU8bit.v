//Verilog HDL for "research", "8bitALU" "functional"


module ALU8bit( input [3:0] Opcode,
                input [7:0] Operand1,
                input [7:0] Operand2,
                output reg [15:0] Result,
                output reg flagC,
                output reg flagZ
    );
parameter [3:0] ADD = 4'b0000;
parameter [3:0] SUB = 4'b0001;
parameter [3:0] MUL = 4'b0010;
parameter [3:0] DIV = 4'b0011;
parameter [3:0] AND = 4'b0100;
parameter [3:0] OR = 4'b0101;
parameter [3:0] NAND = 4'b0110;
parameter [3:0] NOR = 4'b0111;
parameter [3:0] XOR = 4'b1000;

always @ (Opcode or Operand1 or Operand2)
begin
case(Opcode)
ADD: begin
    Result = Operand1 + Operand2;
    flagC = Result[8];
    flagZ = (Result == 16'b0);
  end
SUB: begin
    Result = Operand1 - Operand2;
    flagC = Result[8];
    flagZ = (Result == 16'b0);
  end
MUL: begin
    Result = Operand1 * Operand2;
    flagZ = (Result == 16'b0);
  end
DIV: begin
    Result = Operand1 / Operand2;
    flagZ = (Result == 16'b0);
  end
AND: begin
    Result = Operand1 & Operand2;
    flagZ = (Result == 16'b0);
  end
OR: begin
    Result = Operand1 | Operand2;
    flagZ = (Result == 16'b0);
  end
NAND: begin
    Result = ~(Operand1 & Operand2);
    flagZ = (Result == 16'b0);
  end
NOR: begin
    Result = ~(Operand1 | Operand2);
    flagZ = (Result == 16'b0);
  end
XOR: begin
    Result = Operand1 ^ Operand2;
    flagZ = (Result == 16'b0);
  end
default: begin
    Result = 16'b0;
    flagC = 1'b0;
    flagZ = 1'b0;
  end
endcase
end
endmodule
