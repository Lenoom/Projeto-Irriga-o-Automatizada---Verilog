module main(
    input clock,
    input button,
    input umidadeAr,
    input umidadeSolo,
    input temperatura,
    input [2:0] nivelDagua,
    output [3:0] digitos,
    output [7:0] segmentos,
    output [6:0] linhas,
    output [4:0] colunas
);

wire buttonPulse, displayClock, umSegundo, aspersao, gotejamento, casoEspecifico;
wire [2:0] nivelAtualizado;
wire [6:0] linhasNivel, linhasRega;
wire [4:0] colunasNivel, colunasRega;

wire erro;

assign nivelAtualizado = nivelDagua;

divisorFrequencia(clock, displayClock, umSegundo);

debouncer(displayClock, button, buttonPulse);


tipoRega(
    umidadeAr,
    umidadeSolo,
    temperatura,
    nivelDagua,
    alarme,
    gotejamento,
    aspersao,
	 casoEspecifico,
	 erro
);

cronometro(buttonPulse, umSegundo, displayClock, aspersao, gotejamento, casoEspecifico, nivelDagua, digitos, segmentos, );


LedMatrizN(displayClock, alarme, erro, nivelAtualizado[2], nivelAtualizado[1], nivelAtualizado[0], colunasNivel[0], colunasNivel[1], colunasNivel[2], colunasNivel[3], colunasNivel[4], linhasNivel[0], linhasNivel[1], linhasNivel[2], linhasNivel[3], linhasNivel[4], linhasNivel[5], linhasNivel[6]);


LedMatrizR(displayClock, aspersao, gotejamento, colunasRega[0], colunasRega[1], colunasRega[2], colunasRega[3], colunasRega[4], linhasRega[0], linhasRega[1], linhasRega[2], linhasRega[3], linhasRega[4], linhasRega[5], linhasRega[6]);

mux_2_1_1(linhasNivel[0], linhasRega[0], umSegundo, linhas[0]);
mux_2_1_1(linhasNivel[1], linhasRega[1], umSegundo, linhas[1]);
mux_2_1_1(linhasNivel[2], linhasRega[2], umSegundo, linhas[2]);
mux_2_1_1(linhasNivel[3], linhasRega[3], umSegundo, linhas[3]);
mux_2_1_1(linhasNivel[4], linhasRega[4], umSegundo, linhas[4]);
mux_2_1_1(linhasNivel[5], linhasRega[5], umSegundo, linhas[5]);
mux_2_1_1(linhasNivel[6], linhasRega[6], umSegundo, linhas[6]);

mux_2_1_1(colunasNivel[0], colunasRega[0], umSegundo, colunas[0]);
mux_2_1_1(colunasNivel[1], colunasRega[1], umSegundo, colunas[1]);
mux_2_1_1(colunasNivel[2], colunasRega[2], umSegundo, colunas[2]);
mux_2_1_1(colunasNivel[3], colunasRega[3], umSegundo, colunas[3]);
mux_2_1_1(colunasNivel[4], colunasRega[4], umSegundo, colunas[4]);

endmodule
