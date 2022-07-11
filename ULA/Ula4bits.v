module Ula4bits (B, A, X0, X1, X2, Igual, menor, F0); //TS

	input [3:0] B, A;
	input X0, X1, X2;
	
	output [3:0] F0;
	output Igual, menor; //TS,
	
	wire [3:0] aux_TS, aux_Igual, aux_F0;
	
	//module Ula1Bit(B, A, arit, comp, X1, X2, clock, EnableMux, TS, Igual, F0);
	Ula1Bit Operacao1(B[3], A[3], X0			, X0			  , X1, X2, aux_TS[3], aux_Igual[3], aux_F0[3]);
	Ula1Bit Operacao2(B[2], A[2], aux_TS[3], aux_Igual[3], X1, X2, aux_TS[2], aux_Igual[2], aux_F0[2]);
	Ula1Bit Operacao3(B[1], A[1], aux_TS[2], aux_Igual[2], X1, X2, aux_TS[1], aux_Igual[1], aux_F0[1]);
	Ula1Bit Operacao4(B[0], A[0], aux_TS[1], aux_Igual[1], X1, X2, aux_TS[0], aux_Igual[0], aux_F0[0]);
	
	
	assign F0[0] = aux_F0[0];
	assign F0[1] = aux_F0[1];
	assign F0[2] = aux_F0[2];
	assign F0[3] = aux_F0[3];
	assign menor = aux_F0[0] | aux_F0[1] | aux_F0[2] | aux_F0[3]  ;
	assign Igual = aux_Igual[0];

endmodule 