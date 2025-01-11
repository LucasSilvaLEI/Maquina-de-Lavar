`timescale 1ns / 1ps

module atraso_inicio(
    input wire clk,
    input wire iniciar,      
    input wire [2:0] atraso, 
    output reg pronto        
);
    reg [2:0] contador;  
     always @(posedge clk) begin
        if (iniciar) begin
            if (contador < atraso) begin
                contador <= contador + 1;  
                pronto <= 0;  
            end else begin
                pronto <= 1;  
            end
        end else begin
            pronto <= 0;  
        end
    end
endmodule
