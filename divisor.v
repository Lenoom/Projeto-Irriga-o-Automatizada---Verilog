module divisorFrequencia(
    input clock,
    output displayClock,
    output clockOut
);

wire [30:0] aux;
/*
divisorDez(clock, aux[0]);
divisorDez(aux[0], aux[1]);
divisorDez(aux[1], aux[2]);
divisorDez(aux[2], aux[3]);
divisorDez(aux[3], aux[4]);
divisorDez(aux[4], aux[5]);
divisorDez(aux[5], aux[6]);
divisorCinco(aux[6], clockOut);
*/

divisorCinco(clock, aux[0]);
divisorCinco(aux[0], aux[1]);
divisorCinco(aux[1], aux[2]);
divisorCinco(aux[2], aux[3]);
divisorCinco(aux[3], aux[4]);
divisorCinco(aux[4], aux[5]);
divisorCinco(aux[5], aux[6]);
divisorCinco(aux[6], aux[7]);
flipFlopT(!aux[7], 1, 0, 0, aux[8]);
flipFlopT(!aux[8], 1, 0, 0, aux[9]);
flipFlopT(!aux[9], 1, 0, 0, aux[10]);
flipFlopT(!aux[10], 1, 0, 0, aux[11]);
flipFlopT(!aux[11], 1, 0, 0, aux[12]);
flipFlopT(!aux[12], 1, 0, 0, aux[13]);
flipFlopT(!aux[13], 1, 0, 0, aux[14]);
assign clockOut = aux[14];
assign displayClock = aux[6];

endmodule

module divisorCinco(
    input clockIn,
    output clockOut
);

wire [3:0] aux;

contador_0_4(clockIn, aux, clockOut);

endmodule

module divisorDez(
    input clock,
    output clockOut
);

wire [3:0] aux;

contador_0_9(clock, aux, clockOut);

endmodule
