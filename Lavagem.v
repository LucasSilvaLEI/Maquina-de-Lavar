`timescale 1ns / 1ps
module lavagem(
    input wire clock,
    input wire start,
    output reg lavagem_ativa
);
    parameter TEMPO_LAVAGEM = 5; 
    reg [2:0] contador;
	     always @(posedge clock) begin
        if (start) begin
            if (contador < TEMPO_LAVAGEM) begin
                contador <= contador + 1;
                lavagem_ativa <= 1'b1;
            end else begin
                lavagem_ativa <= 1'b0;
            end
        end else begin
            contador <= 0;
            lavagem_ativa <= 1'b0;
        end
    end
endmodule
