`timescale 1ns / 1ps

module Alerta_FIm_LAvagem(    input ciclo_concluido, 
    input clk,
    input reset,
    output reg alerta 
);
always @(posedge clk or posedge reset) begin
    if (reset) begin
        alerta <= 0; 
    end else begin
        if (ciclo_concluido) begin
            alerta <= 1; 
        end else begin
            alerta <= 0; 
        end
    end
end
endmodule

