`timescale 1ns / 1ps
module Protecao(
    input wire clk,
    input wire reset,
    input wire energia,
    input wire [3:0] estado, 
    output reg [3:0] estado_registrado 
);
    always @(posedge clk or negedge reset) begin
        if (!reset) begin
            estado_registrado <= 4'b0000; 
        end else if (!energia) begin
            estado_registrado <= estado; 
        end else begin
            estado_registrado <= estado_registrado; 
        end
    end
endmodule
