//módulo para simulação → não possui entrada nem saída
module and_nand;
 reg a, b;
 wire out1, out2;
 
 initial begin // Dados de teste
 a = 0; b = 0;
 #1 a = 1; 
 #1 b = 1;
 #1 a = 0;
 end
 
 initial begin 
 $monitor("Time=%0d a=%b b=%b out1=%b out2=%b",
 $time, a, b, out1, out2);
 end
 
 C_AND gate1(a, b, out2);
 C_NAND gate2(a, b, out1);
 
endmodule