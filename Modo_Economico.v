`timescale 1ns / 1ps

module Modo_Economico(
    input eco, 
    input clk,
    input reset,
    output reg [7:0] duracao_lavagem 
);
 always @(posedge clk or posedge reset) begin
    if (reset) begin
        duracao_lavagem <= 8'd100; 
    end else begin
        if (eco) begin
            duracao_lavagem <= 8'd60; 
        end else begin
            duracao_lavagem <= 8'd100; 
        end
    end
end
endmodule   
