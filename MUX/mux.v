module mux(entrada1, entrada2, sinalMux, saida);
	input wire [7:0] entrada1;
	input wire [7:0] entrada2;
	input wire sinalMux;
	output wire [7:0] saida;
	
	assign saida = (sinalMux) ? entrada2 :  entrada1;
	
endmodule

