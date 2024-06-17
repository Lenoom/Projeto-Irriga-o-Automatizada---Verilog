module flipFlopD(
    input clock,
    input data,
    input reset,
    output reg outQ
);

always@(posedge clock or posedge reset) begin
    if (reset) begin
        outQ <= 0;
    end
    else begin
        outQ <= data;
    end
end

endmodule

module debouncer(
    input clock,
    input botao,
    output saida
);

wire [2:0] aux;

flipFlopD(clock, botao, 0, aux[0]);
flipFlopD(clock, aux, 0, aux[1]);
not(aux[2], aux[1]);
and(saida, aux[2], aux[0]);

endmodule
