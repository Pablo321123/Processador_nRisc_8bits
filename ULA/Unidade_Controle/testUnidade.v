module testUnidade();
  reg [2:0] opCode;
  reg reset;
  wire Jump, MemWrite, beq, MemRead, UlaSrc, RegSrc;
  wire [1:0] PCWrite, RegWrite, UlaOp;

  initial begin
    reset = 0; 
    #1 opCode = 3'b000; //lw
    #1 reset = 1;
    #1 reset = 0;
    #1 opCode = 3'b001; //sw
    #1 opCode = 3'b010; //add
    #1 opCode = 3'b011; //addi
    #1 opCode = 3'b100; //slt
    #1 opCode = 3'b101; //jmp
    #1 opCode = 3'b110; //beq
    #1 opCode = 3'b111; //halt
  end
  
  initial begin
    $monitor("Time = %0d | reset = %b | opCode = %b | UlaOp = %b | \n |RegSrc = %b| Jump = %b | RegWrite = %b | ULA Src = %b | MemWrite = %b | MemRead = %b | PC Write = %b | beq = %b  \n ", 
				 $time, reset, opCode, UlaOp, RegSrc, Jump, RegWrite, UlaSrc, MemWrite, MemRead, PCWrite, beq);
  end
  
   UnidadeControle  unidadeControle (opCode, reset, PCWrite, RegWrite, UlaOp, beq, MemRead, MemWrite, UlaSrc, RegSrc, Jump);
  
  
endmodule