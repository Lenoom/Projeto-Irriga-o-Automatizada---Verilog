module dFlipFlop(input d,  
	input rstn,  
		input clk,  
		output reg q,
	output q_);

	assign q_ = !q;
		  
		always @ (posedge clk or posedge rstn)  begin
	if (rstn)  
	q <= 0;  
			else  
				q <= d;  
	end

endmodule

module LedMatrizN(delay, Alarm, erro, H, M, L, col_1, col_2, col_3, col_4, col_5, lin_1, lin_2, lin_3, lin_4, lin_5, lin_6, lin_7);

input delay, Alarm, erro, H, M, L;
output col_1, col_2, col_3, col_4, col_5, lin_1, lin_2, lin_3, lin_4, lin_5, lin_6, lin_7;

not(nH, H);
not(nL, L);
not(nM, M);
not(nAl, Alarm);

wire Q1, Q2, Q3, Q1_, Q2_, Q3_;
    
dFlipFlop dff0(Q1_, 0, delay, Q1, Q1_);
dFlipFlop dff1(Q2_, 0, Q1_, Q2, Q2_);
dFlipFlop dff2(Q3_, 0, Q2_, Q3, Q3_);

and(col_1, Q1_, Q2_, Q3_);
and(col_2, Q1, Q2_, Q3_);
and(col_3, Q1_, Q2, Q3_);
and(col_4, Q1, Q2, Q3_);
and(col_5, Q1_, Q2_, Q3);

// Nivel Low
or(L1, col_1, col_2, col_3, col_4, col_5);
or(L2, col_1, col_2, col_3, col_4, col_5);
or(L3, col_1, col_2, col_3, col_4, col_5);
or(L4, col_1, col_2, col_3, col_4, col_5);
or(L5, col_1, col_2, col_3, col_4, col_5);
or(L6, col_1, col_2, col_3, col_4, col_5);

and(L_S1, L1, L, nH, nM, nAl);
and(L_S2, L2, L, nH, nM, nAl);
and(L_S3, L3, L, nH, nM, nAl);
and(L_S4, L4, L, nH, nM, nAl);
and(L_S5, L5, L, nH, nM, nAl);
and(L_S6, L6, L, nH, nM, nAl);

// Nivel Medio
or(M1, col_1, col_2, col_3, col_4, col_5);
or(M2, col_1, col_2, col_3, col_4, col_5);
or(M3, col_1, col_2, col_3, col_4, col_5);
or(M5, col_1, col_2, col_3, col_4, col_5);
or(M6, col_1, col_2, col_3, col_4, col_5);

and(M_S1, M1, L, nH, M, nAl);
and(M_S2, M2, L, nH, M, nAl);
and(M_S3, M3, L, nH, M, nAl);
and(M_S5, M5, L, nH, M, nAl);
and(M_S6, M6, L, nH, M, nAl);

// Nivel Alto
or(H2, col_1, col_2, col_3, col_4, col_5);
or(H3, col_1, col_2, col_3, col_4, col_5);
or(H5, col_1, col_2, col_3, col_4, col_5);
or(H6, col_1, col_2, col_3, col_4, col_5);

and(H_S2, H2, L, H, M, nAl);
and(H_S3, H3, L, H, M, nAl);
and(H_S5, H5, L, H, M, nAl);
and(H_S6, H6, L, H, M, nAl);

// CRITICO
or(C2, col_2, col_3, col_4, col_5);
or(C3, col_2, col_3, col_4, col_5);
or(C5, col_2, col_3, col_4, col_5);
or(C6, col_2, col_3, col_4, col_5);


// ERRO
or(E2, col_2, col_3, col_4, col_5);
or(E3, col_2, col_3, col_4, col_5);
or(E4, col_2, col_3, col_4, col_5);
or(E5, col_2, col_3, col_4, col_5);
or(E6, col_2, col_3, col_4, col_5);


// Exibindo na matriz
mux_2_1_1 muxEC(C4, E4, erro, caso);

or(lin_1, L_S1, M_S1);
or(lin_2, L_S2, M_S2, H_S2, E2, C2);
or(lin_3, L_S3, M_S3, H_S3, E3, C3);
or(lin_4, L_S4, M_S4, H_S4, caso);
or(lin_5, L_S5, M_S5, H_S5, E5, C5);
or(lin_6, L_S6, M_S6, H_S6, E6, C6);

endmodule

module LedMatrizR(delay, sinal_A, sinal_G, col_1, col_2, col_3, col_4, col_5, lin_1, lin_2, lin_3, lin_4, lin_5, lin_6, lin_7);

input delay, sinal_A, sinal_G;
output col_1, col_2, col_3, col_4, col_5, lin_1, lin_2, lin_3, lin_4, lin_5, lin_6, lin_7;

wire w1, w2, w3, W1_, W2_, W3_;
    
dFlipFlop dff0(W1_, 0, delay, w1, W1_);
dFlipFlop dff1(W2_, 0, W1_, w2, W2_);
dFlipFlop dff2(W3_, 0, W2_, w3, W3_);

and(col_1, W1_, W2_, W3_);
and(col_2, w1, W2_, W3_);
and(col_3, W1_, w2, W3_);
and(col_4, w1, w2, W3_);
and(col_5, W1_, W2_, w3);

// Acende "A"
or(A2, col_2, col_3, col_4);
or(A3, col_2, col_3, col_4);
or(A4, col_2, col_3, col_4);
or(A6, col_2, col_3, col_4);
or(A7, col_2, col_3, col_4);

and(A_S2, A2, sinal_A);
and(A_S3, A3, sinal_A);
and(A_S4, A4, sinal_A);
and(A_S6, A6, sinal_A);
and(A_S7, A7, sinal_A);

// Acende "G"
or(G2, col_2, col_3, col_4, col_5);
or(G3, col_2, col_3, col_4, col_5);
or(G4, col_2, col_3);
or(G5, col_2, col_3, col_4);
or(G6, col_2, col_3, col_4);

and(G_S2, G2, sinal_G);
and(G_S3, G3, sinal_G);
and(G_S4, G4, sinal_G);
and(G_S5, G5, sinal_G);
and(G_S6, G6, sinal_G);

// Acende "0"
or(O2, col_2, col_3, col_4);
or(O3, col_2, col_3, col_4);
or(O4, col_2, col_3, col_4);
or(O5, col_2, col_3, col_4);
or(O6, col_2, col_3, col_4);

not(nSinalA, sinal_A);
not(nSinalG, sinal_G);

and(O_S2, O2, nSinalA, nSinalG);
and(O_S3, O3, nSinalA, nSinalG);
and(O_S4, O4, nSinalA, nSinalG);
and(O_S5, O5, nSinalA, nSinalG);
and(O_S6, O6, nSinalA, nSinalG);

// Condições para acender
or(lin_2, A_S2, G_S2, O_S2);
or(lin_3, A_S3, G_S3, O_S3);
or(lin_4, A_S4, G_S4, O_S4);
or(lin_5, A_S5, G_S5, O_S5);
or(lin_6, A_S6, G_S6, O_S6);
or(lin_7, A_S7, G_S7, O_S7);

endmodule
