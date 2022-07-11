module extensorSinal(instruction, immediate);
    input [7:0] instruction;
    output [7:0] immediate;

    wire [2:0] opcode = instruction [7:5];

    assign immediate = 
    (opcode == 3'b000) ?  instruction[2:0] : // load
	 (opcode == 3'b001) ?  instruction[2:0] :	// store 
    (opcode == 3'b010) ?  instruction[3:0] : // add
    (opcode == 3'b011) ?  instruction[3:0] :	// addi
	 (opcode == 3'b100) ?  instruction[4:0] :	// beq
    (opcode == 3'b101) ?  instruction[3:0] :	// slt
    (opcode == 3'b110) ?  instruction[4:0] : 8'b00001000; // j
	 //(opcode == 3'b111) ?  instruction[4:0] :	// halt

endmodule 