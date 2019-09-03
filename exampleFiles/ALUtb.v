//Verilog HDL for "research", "8bitALUtb" "functional"

module ALUtb  ( );
wire [3:0] Opcode;
wire [7:0] Operand1;
wire [7:0] Operand2;
wire [15:0] Result;
wire flagC;
wire flagZ;
reg [3:0] testOpcode;
reg [7:0] testOperand1;
reg [7:0] testOperand2;
reg [15:0] testResult;

assign Opcode = testOpcode;
assign Operand1 = testOperand1;
assign Operand2 = testOperand2;

initial begin
    $printtimescale(ALUtb);
    $monitor($time, " Opcode = %b Operand1 = %d Operand2 = %d Result = %d flagC = %b flagZ = %b", Opcode, Operand1, Operand2, Result, flagC, flagZ);
    $sdf_annotate("/home/du.566/cadence/GPDK45/synth/genus/ALU.sdf", ALUtb.uut, , "alusdf.log", "MAXIMUM", , "FROM_MTM");
end

ALU8bit uut(Opcode, Operand1, Operand2, Result, flagC, flagZ);
initial begin
    testOpcode = 4'b0000;
    testOperand1 = 123;
    testOperand2 = 100;
    #1 testOpcode = 4'b0001;
    #2 testOperand1 = 222;
    #2 testOperand2 = 10;
    #3 testOpcode = 4'b0011;
end

initial begin
    #1000 $finish;
end
endmodule
