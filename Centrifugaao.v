`timescale 1ns / 1ps
module centrifugacao(
    input wire clock,
    input wire start,
    output reg centrifugacao_ativa
);
    parameter TEMPO_CENTRIFUGACAO = 5;
    reg [2:0] contador;
    always @(posedge clock) begin
        if (start) begin
            if (contador < TEMPO_CENTRIFUGACAO) begin
                contador <= contador + 1;
                centrifugacao_ativa <= 1'b1;
            end else begin
                centrifugacao_ativa <= 1'b0;
            end
        end else begin
            contador <= 0;
            centrifugacao_ativa <= 1'b0;
        end
    end
endmodule
