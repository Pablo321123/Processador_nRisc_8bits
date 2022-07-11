module testUla(); //module Ula4bits (B, A, X0, X1, X2, Igual, menor, F0)
	reg [3:0] B, A;
	reg X0, X1, X2;
	wire [3:0] Igual, menor, F0;
	
	initial begin

	
		//Soma
		//A <= 4'b0101;		
		//B <= 4'b0010;		
		//X0 <= 1'b0;
		//X1 <= 1'b0;
		//X2 <= 1'b0;
		 
		//Subtracao		
		A = 4'b0111;
		B = 4'b0100;
		X0 = 1'b1;
		X1 = 1'b0;
		X2 = 1'b0;
		
		//Slt		
		//B = 4'b0111;
		//A = 4'b0111;		
		//X0 = 1'b1;
		//X1 = 1'b1;
		//X2 = 1'b1;
		
		//beq	
		//B = 4'b0111;
		//A = 4'b0111;		
		//X0 = 1'b1;
		//X1 = 1'b1;
		//X2 = 1'b1;
		
	
	end
	
	initial begin
		$monitor("| Time: %0d |\n| B = %b | A = %b | X0 = %b | X1 = %b |  X2 = %b | RESULTADO: %b | Menor: %b | Igual: %b",
		$time, B, A, X0, X1, X2, F0, menor, Igual);
	end
	
	Ula4bits u4b(B, A, X0, X1, X2, Igual, menor, F0);

endmodule 