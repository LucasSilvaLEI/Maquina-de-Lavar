`timescale 1ns / 1ps
module aquecimento(
    input wire clock,        
    input wire start,
    output reg aquecimento   
);
    parameter TEMPO_AQUECIMENTO = 8; 
    reg [3:0] contador;              
    always @(posedge clock) begin
        if (start) begin
            if (contador < TEMPO_AQUECIMENTO) begin
                contador <= contador + 1;
                aquecimento <= 1'b1;  
            end else begin
                aquecimento <= 1'b0;  
            end
        end else begin
            contador <= 0;            
            aquecimento <= 1'b0;
        end
    end
endmodule
