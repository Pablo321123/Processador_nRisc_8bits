module testMux(); //(entrada1, entrada2, sinalMux, saida)

	reg [7:0] entrada1, entrada2;
	reg sinalMux;
	wire [7:0] saida;
	
	initial begin			  
		  
		  #0 sinalMux = 1'b0;
    		#0 entrada1 = 8'b00000000;
		  #0 entrada2 = 8'b11111111;
		  #20 sinalMux = 1'b1;	  
		  
  		  
		  #0 entrada1 = 8'b00000000;
		  #0 entrada2 = 8'b11111111;	
		  
	end
	
	initial begin
	  
  	  $monitor("Time: %0d\n| Entrada1: %b| Entrada2: %b | sinalMux: %b |\n |Saida: %b |", $time, entrada1, entrada2, sinalMux, saida);
  	  
  end
	
	 mux m(entrada1, entrada2, sinalMux, saida);	
	
endmodule 