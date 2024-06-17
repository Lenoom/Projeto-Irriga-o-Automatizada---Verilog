module tipoRega(
    input umidadeAr,
    input umidadeSolo,
    input temperatura,
    input [2:0] nivelDagua,
    output alarme,
    output gotejamento,
    output aspersao,
	 output casoEspecifico,
	 inout erro
);

wire [10:0] aux;

and(aux[0], nivelDagua[2], !nivelDagua[1]);
and(aux[1], nivelDagua[1], !nivelDagua[0]);
or(erro, aux[0], aux[1]);
//alarme
or(alarme, erro, !nivelDagua[0]);

//gotejamento
or(aux[2], temperatura, !nivelDagua[1]);
and(gotejamento, !alarme, !umidadeSolo, umidadeAr, aux[2]);

//aspersao
and(aux[3], !temperatura, nivelDagua[1]);
or(aux[4], aux[3], !umidadeAr);
and(aspersao, !alarme, !umidadeSolo, aux[4]);

and(casoEspecifico, umidadeAr, !temperatura);

endmodule
