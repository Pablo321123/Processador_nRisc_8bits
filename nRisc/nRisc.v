module nRisc(clk, reset, endMemInst, outMemInst, endMemDado, dadoEntMemDado, outMemDado, memDadoR, memDadoW, oPC);

	input clk, reset;
	input [7:0] outMemInst, outMemDado;
	output [7:0] endMemInst, endMemDado, dadoEntMemDado, oPC;
	output memDadoR, memDadoW;
	

	
	//(Read1, Read2, WriteReg, WriteData, RegWrite, Data1, Data2, clock);
	//input [3:0] , , ; // Registradores para escrita e leitura
   //input [7:0] ; // Dados de gravação
	
	wire beq, MemRead, MemWrite, UlaSrc, RegSrc, Jump; //controle
	wire [1:0] PCWrite, CodeRegWrite, UlaOp; // Controle
	wire [2:0] opcode;
	wire [3:0] Read1, Read2, WriteReg;
	wire [7:0] WriteData, Data1, Data2, oAddPC, saveDataRegister, Address;
	wire selJump, zero, immediate, outputMuxULA, resultULA;	

	assign oAddPC = oPC + 8'h01;	
	assign endMemInst = oPC;
	assign dadoEntMemDado = Data1;
	assign memDadoR = MemRead;
	assign memDadoW = MemWrite;
	
	
	mux muxPC(selJump, oAddPC, Jump, oMuxPc);

	//module pc(Clk, PCWrite, Address, PCNext, Reset);
	pc pc(clk, PCWrite, Address, oMuxPc, reset);
	
	//module UnidadeControle(input[2:0] opcode, input reset, output reg[1:0] PCWrite, RegWrite, UlaOp, output reg beq, MemRead, MemWrite, UlaSrc, RegSrc, Jump);  
	UnidadeControle unidadeControle(opcode, reset, PCWrite, RegWrite, UlaOp, beq, MemRead, MemWrite, UlaSrc, RegSrc, Jump);
	
	//MUXES selecao registradores
	//module mux(entrada1, entrada2, sinalMux, saida);
	mux muxRTorRD(Read2, WriteReg, RegWrite, WriteData);		

	//module bankReg(Read1, Read2, WriteReg, WriteData, RegWrite, Data1, Data2, clock);
	bankReg regs(Read1, Read2, WriteReg, WriteData, RegWrite, Data1, Data2, clock);
	
	//Extensores de bits
	//module extensorSinal(instruction, immediate);
	extensorSinal extensorSinal(outMemInst[3:0], immediate);
	
	//MUXES ULA
	//module mux(entrada1, entrada2, sinalMux, saida);
	mux selImed(Read2, immediate, UlaSrc, outputMuxULA);
	
	//module Ula4bits (B, A, OP, Igual, menor, F0);
	Ula4bits ula(Read2, outputMuxULA, 0, 0, resultULA);
	
	//module memoriaDados(clk, reset, w, r, dEntrada, endereco, dSaida);
	//memoriaDados memDados(clk, reset, memW, memR, oReg1, oUla, oMemDados);
	
	mux selMemToReg(memDadoR, resultULA, MemRead, saveDataRegister);
	
endmodule