`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
module Entrada_Relogio(
    input wire clk_in,      
    output wire clk_out      
);
    assign clk_out = clk_in; 
endmodule   