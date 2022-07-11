module C_AND(a, b, out);
	input a, b;
	output out;
	wire w1;
	
	C_NAND n1(a, b, w1);
	C_NAND n2(w1, w1, out);
endmodule