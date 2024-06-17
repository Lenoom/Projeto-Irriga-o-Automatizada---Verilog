module mux_2_1_1(
    input inA,
    input inB,
    input chaveSeletora,
    output outX
);

wire [1:0] aux;

and(aux[0], !chaveSeletora, inA);
and(aux[1], chaveSeletora, inB);
or(outX, aux[0], aux[1]);

endmodule

module mux_4_2_1(
    input inA,
    input inB,
    input inC,
    input inD,
    input chave0,
    input chave1,
    output outX
);

wire [3:0] aux;

mux_2_1_1(inA, inB, chave0, aux[0]);
mux_2_1_1(inC, inD, chave0, aux[1]);
mux_2_1_1(aux[0], aux[1], chave1, outX);

endmodule


module mux_16_2_4(
    input [3:0] inA,
    input [3:0] inB,
    input [3:0] inC,
    input [3:0] inD,
	 input [1:0] chave,
    output [3:0] outX
);

mux_4_2_1(inA[0], inB[0], inC[0], inD[0], chave[0], chave[1], outX[0]);
mux_4_2_1(inA[1], inB[1], inC[1], inD[1], chave[0], chave[1], outX[1]);
mux_4_2_1(inA[2], inB[2], inC[2], inD[2], chave[0], chave[1], outX[2]);
mux_4_2_1(inA[3], inB[3], inC[3], inD[3], chave[0], chave[1], outX[3]);

endmodule

module demux_1_2_4(
    input inX,
    input [1:0] chaveSeletora,
    output [3:0] outY
);

nand(outY[0], inX, chaveSeletora[0], chaveSeletora[1]);
nand(outY[1], inX, !chaveSeletora[0], chaveSeletora[1]);
nand(outY[2], inX, chaveSeletora[0], !chaveSeletora[1]);
nand(outY[3], inX, !chaveSeletora[0], !chaveSeletora[1]);

endmodule
