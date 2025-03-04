`timescale 1ns / 1ps
module centrifugacao (
    input wire clk,
    input wire iniciar,
    output reg centrifugar
);

    reg [5:0] contador;
    always @(posedge clk) begin
        if (iniciar) begin
            if (contador < 5) begin
                centrifugar <= 1;
                contador <= contador + 1;
            end else begin
                centrifugar <= 0;
                contador <= 0;   
            end
        end else begin
            centrifugar <= 0;
            contador <= 0;
        end
    end

endmodule
