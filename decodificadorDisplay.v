module decodificadorDisplay(
    input umSegundo,
    input displayClock,
	 input [1:0] cont_0_3,
    input [3:0] valor,
    output [7:0] displaySegments
);

wire [10:0] aux;
wire clockDot, sla;

and(aux[0], valor[0], !valor[1], !valor[2], !valor[3]);
and(aux[1], !valor[0], !valor[1], valor[2]);
or(displaySegments[0], aux[0], aux[1]);

and(aux[2], !valor[0], valor[1], valor[2]);
and(aux[3], valor[0], !valor[1], valor[2]);
or(displaySegments[1], aux[2], aux[3]);

and(displaySegments[2], !valor[0], valor[1], !valor[2]);

and(aux[4], valor[0], valor[1], valor[2]);
or(displaySegments[3], displaySegments[0], aux[4]);

and(aux[5], !valor[0], !valor[1], valor[2]);
or(displaySegments[4], valor[0], aux[5]);

and(aux[6], valor[1], !valor[2]);
and(aux[7], valor[0], valor[1]);
and(aux[8], valor[0], !valor[1], !valor[2], !valor[3]);
or(displaySegments[5], aux[6], aux[7], aux[8]);

and(aux[9], valor[0], valor[1], valor[2]);
and(aux[10], !valor[1], !valor[2], !valor[3]);
or(displaySegments[6], aux[9], aux[10]);

and(sla, !cont_0_3[0], cont_0_3[1]);
mux_2_1_1(1, umSegundo, sla, displaySegments[7]);


endmodule

/*
module decodificadorDisplay(A,B,C,D,a,b,c,d,e,f,g);
	input A,B,C,D;
	output a,b,c,d,e,f,g;
	wire nA,nB,nC,nD;
	wire aux[12:0];
	not(nA,A);
	not(nB,B);
	not(nC,C);
	not(nD,D);
	
	// Letra A;
	and(aux[0],nA,nB,nC,D);
	and(aux[1],B,nC,nD);
	or(a,aux[1],aux[0]);
	
	//Letra B;
	and(aux[2],B,nC,D);
	and(aux[3],B,C,nD);
	or(b,aux[2],aux[3]);
	
	//Letra C;
	and(c,nB,C,nD);
	
	//Letra D;
	or(aux[4],B,nC,nD);
	or(aux[5],nA,nB,nC,D);
	or(aux[6],B,C,D);
	and(d,aux[4],aux[5],aux[6]);
	
	//Letra E;
	and(aux[7],B,nC);
	or(e,D,aux[7]);
	
	//Letra F;
	and(aux[8],nB,C);
	and(aux[9],C,D);
	and(aux[10],nA,nB,D);
	or(f,aux[8],aux[9],aux[10]);
	
	//Letra G;
	and(aux[11],nA,nB,nC);
	and(aux[12],B,C,D);
	or(g,aux[11],aux[12]);
	
endmodule
*/