module comparadorMenorIgual(B, A, Habilita, X2, Igual, Saida);
	input B, A, Habilita, X2;
	output Igual, Saida;

	assign Igual = (~(A ^ B)) & Habilita;	
	reg Saida;
	
	always @(*)
		if(X2 == 1'b0)
			Saida = (~(A ^ B)) & Habilita;			
		else
			Saida = (~A & B) & Habilita; //Menor
				
endmodule 