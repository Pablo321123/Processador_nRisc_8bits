module UnidadeControle(input[2:0] opcode, 
                       input reset, 
                       output reg[1:0] PCWrite, RegWrite, UlaOp,
                       output reg beq, MemRead, MemWrite, UlaSrc, RegSrc, Jump);
  
	always @(*)  
		begin  
			if(reset == 1'b1) 
			begin  
                RegSrc = 1'b0;  
                Jump = 1'b0;  
                RegWrite = 1'b0;  
                UlaSrc = 1'b0;  
                UlaOp = 3'b000;  
                MemRead = 1'b0;  
                MemWrite = 1'b0;  
                PCWrite = 1'b1;  
                beq = 1'b0;  
			end  
			else begin  
				case(opcode)   
					3'b000: begin // lw  
                  RegSrc = 1'b0;  
						Jump = 1'b0;  
						RegWrite = 1'b1;  
						UlaSrc = 1'b1;  
						MemRead = 1'b1;  
						MemWrite = 1'b0;  
						PCWrite = 1'b1;  
						beq = 1'b0;  
                end  
      3'b001: begin // sw    
                    RegSrc = 1'b0;  
                    Jump = 1'b0;  
                    RegWrite = 1'b0;  
                    UlaSrc = 1'b1;  
						  MemWrite = 1'b1;
                    MemRead = 1'b0; 
                    PCWrite = 1'b0;  
                    beq = 1'b0;  
                end  
      3'b010: begin //add  
                    RegSrc = 1'b1;  
                    Jump = 1'b0;  
                    RegWrite = 1'b1;  
                    UlaSrc = 1'b0;  
                    UlaOp = 3'b000;  // 000 - ADD
                    MemWrite = 1'b0;
						  MemRead = 1'b0;
                    PCWrite = 1'b0;  
                    beq = 1'b0;   
                end  
      3'b011: begin // addi  
                    RegSrc = 1'b1;  
                    Jump = 1'b0;  
                    RegWrite = 1'b1;  
                    UlaSrc = 1'b1;  
                    UlaOp = 3'b000;  // 000 - ADD
                    MemWrite = 1'b0;
						  MemRead = 1'b0;
                    PCWrite = 1'b0;  
                    beq = 1'b0; 
                end  
      3'b100: begin // slt  
                    RegSrc = 1'b1;  
                    Jump = 1'b1;  
                    RegWrite = 1'b0;  
                    UlaSrc = 1'b0;  
                    UlaOp = 3'b110; //110 - SLT  
                    MemRead = 1'b0;  
                    MemWrite = 1'b0;  
                    PCWrite = 1'b0;  
                    beq = 1'b0;   
                end  
      3'b101: begin // jmp  
                    RegSrc = 1'b0;  
                    Jump = 1'b1;  
                    RegWrite = 1'b0;  
                    UlaSrc = 1'b0;  
                    UlaOp = 3'b000;  // 000 - ADD
                    MemRead = 1'b0;  
                    MemWrite = 1'b0;  
                    PCWrite = 1'b0;  
                    beq = 1'b1;   
                end
		3'b110: begin // beq                       
                    Jump = 1'b1;  
                    RegWrite = 1'b0;                      
                    UlaOp = 3'b111;  // 111 - BEQ                      
                    MemWrite = 1'b0;  
						  MemRead = 1'b1;
                    PCWrite = 1'b0;  
                    beq = 1'b1;   
                end 	 
  
      default: begin  
                    RegSrc = 1'b0;  
                    Jump = 1'b0;  
                    RegWrite = 1'b0;  
                    UlaSrc = 1'b0;                        
                    MemRead = 1'b0;  
                    MemWrite = 1'b0;  
                    PCWrite = 1'b1;  
                    beq = 1'b0; 
                end  
      endcase  
      end  
 end  
 endmodule  
