module cronometro(
    input buttonPulse,
    input umSegundo,
    input displayClock,
    input aspersao,
    input gotejamento,
    input casoEspecifico,
    input [2:0] nivelDagua,
    output [3:0] digitos,
    output [7:0] segmentos,
    output [2:0] nivelAtualizado
);

wire [3:0] Us, Ds, Um, Dm;
wire [1:0] cont_0_3;
wire [3:0] valorSaida, aux;

/*
contagemRegressiva(umSegundo, aspersao, gotejamento, casoEspecifico, nivelDagua, button, Us, Ds, Um, Dm);
*/

geraNum(umSegundo,aspersao,gotejamento,casoEspecifico, buttonPulse, nivelDagua, Us, Ds, Um, Dm);

//seletor do digito ativo no display
contador_0_3(displayClock, cont_0_3);
demux_1_2_4(1, cont_0_3, digitos);

//seletor do valor a ser decodificado no display 
mux_16_2_4(Us, Ds, Um, Dm, cont_0_3, valorSaida);


decodificadorDisplay(umSegundo, displayClock, cont_0_3, valorSaida, segmentos);

endmodule
