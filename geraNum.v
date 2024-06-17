module geraNum(clock,aspersao,gotejamento,casoEspecifico, botao, niveis, Us, Ds, Um, Dm);
    input clock,botao,gotejamento,aspersao,casoEspecifico;
    input [2:0]niveis; // niveis[0] = Low, 1 = Medium, 2 = High
    output [3:0]Us,Ds,Um,Dm;
    wire [3:0] unid_minutopreset,dez_minutopreset,unid_segundopreset,dez_segundopreset;
	 wire clockdseg,clockumin,clockdmin;
    
    // Gera os Presets pra cada situaçao de minutos;
    geraPreset(niveis,aspersao,gotejamento,casoEspecifico,dez_segundopreset,unid_segundopreset,unid_minutopreset,dez_minutopreset);
    
    // Manda os presets pra as instancias de Contadores e retorna o numero de 4 bits a cada clock;
	 
	 // Contador da unidade de segundos
    contadorunidades(clock,unid_segundopreset,botao,Us);
	 
	 // Contador da dezena de segundos
	 and(clockdseg1,Us[3],!Us[2],!Us[1],Us[0]);
	 and(clockdseg2,clock,botao);
	 or(clockdseg,clockdseg1,clockdseg2);
    contadorcinco(clockdseg,dez_segundopreset,botao,Ds);// FUNCIONA
    
	 
	 // Contador da unidade de minutos
	 and(clockumin1,!Ds[3],Ds[2],!Ds[1],Ds[0]);
	 and(clockumin2,botao,clock);
	 or(clockumin,clockumin1,clockumin2);
    contadorunidades(clockumin,unid_minutopreset,botao,Um);
	 
	 // Contador da dezena de minutos
	 and(clockdmin1,Um[0],!Um[1],!Um[2],Um[3]);
	 and(clockdmin2,clock,botao);
	 or(clockdmin,clockdmin1,clockdmin2);
    contador(clockdmin,dez_minutopreset,botao,Dm);

endmodule