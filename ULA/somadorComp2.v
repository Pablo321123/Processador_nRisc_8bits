module somadorComp2(B, A, TE, S, TS); //TE representa o tipo de operacao, sendo 0 para soma e 1 para subtracao
	input B, A, TE; // [3:0]
	output S; // [3:0]
	output TS; // [3:0]
	
	wire aux_S, aux_TS; // [3:0]
	
   meioSomador Operacao1 ((TE ^ B), A,   TE, aux_S, aux_TS);
	//meioSomador Operacao2 ((Te ^ B[1]), A[1], aux_TS[0], aux_S[1], aux_TS[1]);
	//meioSomador Operacao3 ((Te ^ B[2]), A[2], aux_TS[1], aux_S[2], aux_TS[2]);
	//meioSomador Operacao4 ((Te ^ B[3]), A[3], aux_TS[2], aux_S[3], aux_TS[3]);	
	
	assign S = aux_S;
	assign TS = aux_TS;
	//assign S[0] = aux_S[1];
	//assign S[0] = aux_S[2];
	//assign S[0] = aux_S[3];
	
endmodule 