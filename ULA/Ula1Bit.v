module Ula1Bit(B, A, arit, comp, X1, X2, TS, Igual, F0); //X0 - arit, comp

	input B, A, arit, comp, X1, X2; 
	output TS, Igual, F0;
	
	reg F0;
	
	wire aux_TS, aux_Igual, aux_S0, aux_S1;
	
	//(B, A, TE, S, TS);
	somadorComp2 sc1(B, A, arit, aux_S0, aux_TS);
	
	//(B, A, Habilita, X2, Igual, Saida, clock)
	comparadorMenorIgual cmi1(B, A, comp, X2, aux_Igual, aux_S1);
	
	assign TS = aux_TS;
	assign Igual = aux_Igual;	
	
	always @(*)
		begin
			if(X1 == 1'b1)
				begin
					F0 = aux_S1; //menor ou igual
				end
			else
				begin
					F0 = aux_S0; //soma ou subtracao
				end
		end
endmodule 