`timescale 1ns / 1ps
module porta(
    input wire clock,
    input wire start,
    input wire fim_lavagem,
    output reg porta_fechada
);
    always @(posedge clock) begin
        if (start) begin
            porta_fechada <= 1'b1;
        end else if (fim_lavagem) begin
            porta_fechada <= 1'b0;
        end
    end
endmodule
