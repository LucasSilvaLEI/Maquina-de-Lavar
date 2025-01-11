`timescale 1ns / 1ps

module enxaguar(
    input wire clock,
    input wire start,
    output reg enxaguar_ativo
);
    parameter TEMPO_ENXAGUAR = 5; 
    reg [2:0] contador;

    always @(posedge clock) begin
        if (start) begin
            if (contador < TEMPO_ENXAGUAR) begin
                contador <= contador + 1;
                enxaguar_ativo <= 1'b1;
            end else begin
                enxaguar_ativo <= 1'b0;
            end
        end else begin
            contador <= 0;
            enxaguar_ativo <= 1'b0;
        end
    end
endmodule
