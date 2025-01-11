`timescale 1ns / 1ps

module Botao(
    input wire clk,
    input wire reset,
    input wire botao_iniciar,
    output reg pulso
);
    reg botao_iniciar_ant;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            botao_iniciar_ant <= 0;
            pulso <= 0;
        end else begin
            botao_iniciar_ant <= botao_iniciar;
            pulso <= botao_iniciar & ~botao_iniciar_ant;
        end
    end
endmodule
