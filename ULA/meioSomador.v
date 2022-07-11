module meioSomador(B, A, TE, So, TS);
	input B, A, TE;
	output So, TS;
	
	assign So = (B ^ TE) ^ A;
	assign TS = (TE & B) | (B & A) | (TE & A);
	
endmodule 