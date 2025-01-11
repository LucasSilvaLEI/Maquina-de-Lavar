`timescale 1ns / 1ps
module Detergente(
    input wire clock,
    input wire start,
    output reg libertar_detergente
);
    always @(posedge clock) begin
        if (start) begin
            libertar_detergente <= 1'b1;
        end else begin
            libertar_detergente <= 1'b0;
        end
    end
endmodule
