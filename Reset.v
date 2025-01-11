`timescale 1ns / 1ps

module Reset_Generator(
    input wire clk,
    output reg reset
);
    initial begin
        reset = 1; 
        #10 reset = 0; 
    end
endmodule
