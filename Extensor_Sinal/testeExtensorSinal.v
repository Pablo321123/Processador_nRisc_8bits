module testeExtensorSinal();
    reg [7:0] instruction;
    wire [7:0] immediate;
    reg[8*10:1]str1; 

    initial begin		  
		  
			#0 instruction = 8'b00000001;
			str1 = "load";
      
      
			#10 instruction = 8'b00100010; 
			str1 = "Store";
		
		  
			#20 instruction = 8'b01000100; 
			str1 = "add";
		  
		  
			#30 instruction = 8'b01101000; 
			str1 = "addi";
				
		 
			#40 instruction = 8'b10010000; 
			str1 = "beq";
		  
		  
			#50 instruction = 8'b10100011;
			str1 = "slt";
		
		  
			#60 instruction = 8'b11000111;
			str1 = "Jump";
		
		  
			#70 instruction = 8'b11101111;
			str1 = "Halt";
		end
		
		initial begin
			
			$monitor("Time: %0d\n| instruction = %b | immediate = %b | name: %s", $time, instruction, immediate, str1 );			
		end
		
		extensorSinal es(instruction, immediate);

endmodule 