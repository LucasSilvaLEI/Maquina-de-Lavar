`timescale 1ns / 1ps

module Detergente(
    input wire clk,
    input wire iniciar,
    output reg libertar_detergente
);

    always @(posedge clk) begin
        if (iniciar)
            libertar_detergente <= 1;
        else
            libertar_detergente <= 0;
    end

endmodule