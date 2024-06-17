module contador_0_3(
    input clock,
    output [1:0] vetor,
    output valorMaximo
);

flipFlopT(!clock, 1, 0, 0, vetor[0]);
flipFlopT(!vetor[0], 1, 0, 0, vetor[1]);
and(valorMaximo, vetor[0], vetor[1]);

endmodule

module contador_0_4(
    input clock,
    output [3:0] vetor,
    output reset
);

wire [2:0] aux;

flipFlopT(!clock, 1, 0, reset, aux[0]);
flipFlopT(!aux[0], 1, 0, reset, aux[1]);
flipFlopT(!aux[1], 1, 0, reset, aux[2]);
and(reset, aux[0], aux[2]);

endmodule

module contador_0_9(
    input clock,
    output [3:0] vetor,
    output reset
);

wire [3:0] aux;

flipFlopT(!clock, 1, 0, reset, aux[0]);
flipFlopT(!aux[0], 1, 0, reset, aux[1]);
flipFlopT(!aux[1], 1, 0, reset, aux[2]);
flipFlopT(!aux[2], 1, 0, reset, aux[3]);
and(reset, aux[0], aux[3]);

endmodule
