module contador(clock,preset,button,Q);
 input clock,button;
 input [3:0]preset;
 output [3:0]Q;
 wire [3:0]resetin;
 wire [3:0] presetout,resetout,aux;
 wire sinal;
 or(botao,sinal,button);
 
 not(resetin[0],preset[0]);
 not(resetin[1],preset[1]);
 not(resetin[2],preset[2]);
 not(resetin[3],preset[3]);
 
 and(presetout[0], botao, preset[0]);
 and(presetout[1], botao, preset[1]);
 and(presetout[2], botao, preset[2]);
 and(presetout[3], botao, preset[3]);
 
 and(resetout[0], botao, resetin[0]);
 and(resetout[1], botao, resetin[1]);
 and(resetout[2], botao, resetin[2]);
 and(resetout[3], botao, resetin[3]);
 
 FlipFlopT(presetout[0],resetout[0],1,clock,Q[0]);  // D
 
 or(aux[0],Q[3],Q[2],Q[1]);
 and(T1,aux[0],!Q[0]);
 FlipFlopT(presetout[1],resetout[1],T1,clock,Q[1]); // C
 
 and(aux[1],!Q[1],Q[2]);
 or(aux[2],aux[1],Q[3]);
 and(T2,aux[2],!Q[0]);
 FlipFlopT(presetout[2],resetout[2],T2,clock,Q[2]); // B
 
 and(T3,!Q[2],!Q[1],!Q[0]);
 FlipFlopT(presetout[3],resetout[3],T3,clock,Q[3]); // A
 
 // Abaixo, verifica qual contador está sendo rodado, e ao chegar em 0000 manda um pulso simulando o botão -
 // para pre-setar os valores novamente;
 and(sinal,!Q[0],!Q[1],!Q[2],!Q[3]);
 
 
endmodule
