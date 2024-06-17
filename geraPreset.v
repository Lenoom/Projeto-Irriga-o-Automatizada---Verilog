module geraPreset(niveis,aspersao,gotejamento,casoEspecifico,dez_segundopreset,unid_segundopreset,unid_minutopreset,dez_minutopreset);
	output [3:0] dez_segundopreset,unid_segundopreset,dez_minutopreset,unid_minutopreset;
	input aspersao,gotejamento,casoEspecifico;
	input [2:0] niveis;
	
	assign unid_segundopreset = 4'b0000;
	assign dez_segundopreset = 4'b0000;
	assign unid_minutopreset = 4'b0101;
	assign dez_minutopreset = 4'b0001;
endmodule