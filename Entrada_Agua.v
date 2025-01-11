`timescale 1ns / 1ps
module entrada_agua(
    input wire clock,          
    input wire start,          
    output reg entrada_agua    
);
    reg estado;

    always @(posedge clock) begin
        if (start) begin
            estado <= 1'b1;    
        end else begin
            estado <= 1'b0;     
        end
    end
    always @(posedge clock) begin
        entrada_agua <= estado;
    end
endmodule
