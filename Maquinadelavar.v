`timescale 1ns / 1ps
module MAquina_Lavar(
  input wire clk,
  input wire reset,
  input wire botao_iniciar,
  input wire energia,
  input wire [2:0] atraso_minutos, 
  output reg [3:0] estado,
  output reg porta_fechada, 
  output reg entrada_agua,
  output reg aquecimento,
  output reg detergente,
  output reg lavagem,
  output reg enxaguar,
  output reg centrifugacao,
  output reg [3:0] estado_atual 
);

    parameter ESPERA = 4'b0000;
    parameter ATRASO = 4'b0001;
    parameter ENTRADA_AGUA = 4'b0010;
    parameter AQUECIMENTO = 4'b0011;
    parameter DETERGENTE = 4'b0100;
    parameter LAVAGEM = 4'b0101;
    parameter ENXAGUAR = 4'b0110;
    parameter CENTRIFUGACAO = 4'b0111;
    parameter FIM = 4'b1000;

    wire botao_pulso;
    wire libertar_detergente;
    wire aquecimento_ativo;
    wire centrifugacao_ativa;
    wire enxaguar_ativo;
    wire lavagem_ativa;
    wire entrada_agua_ativa;
	 
    Botao botao_modulo (
        .clk(clk),
        .reset(reset),
        .botao_iniciar(botao_iniciar),
        .pulso(botao_pulso)
    );
    Detergente detergente_modulo (
        .clock(clk),
        .start(lavagem_ativa),
        .libertar_detergente(libertar_detergente)
    );

    aquecimento aquecimento_modulo (
        .clock(clk),
        .start(entrada_agua_ativa),
        .aquecimento(aquecimento_ativo)
    );
    centrifugacao centrifugacao_modulo (
        .clock(clk),
        .start(enxaguar_ativo),
        .centrifugacao_ativa(centrifugacao_ativa)
    );

    entrada_agua entrada_agua_modulo (
        .clock(clk),
        .start(botao_pulso),
        .entrada_agua(entrada_agua_ativa)
    );
    enxaguar enxaguar_modulo (
        .clock(clk),
        .start(lavagem_ativa),
        .enxaguar_ativo(enxaguar_ativo)
    );

    lavagem lavagem_modulo (
        .clock(clk),
        .start(start), 
        .lavagem_ativa(lavagem_ativa)
    );
    porta porta_modulo (
        .clock(clk),
        .start(botao_pulso),
        .fim_lavagem(fim_lavagem), 
        .porta_fechada(porta_fechada)
    );
	 
    reg [2:0] atraso_contador;
    reg [3:0] ciclo_contador; 
    reg [3:0] estado_anterior; 
	 
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            estado <= ESPERA;
            porta_fechada <= 1;
            entrada_agua <= 0;
            aquecimento <= 0;
            detergente <= 0;
            lavagem <= 0;
            enxaguar <= 0;
            centrifugacao <= 0;
            ciclo_contador <= 0; 
            atraso_contador <= 0;
            estado_atual <= ESPERA; 
            estado_anterior <= ESPERA; 
        end else if (!energia) begin
		  
            estado_anterior <= estado;
            entrada_agua <= 0;
            aquecimento <= 0;
            detergente <= 0;
            lavagem <= 0;
            enxaguar <= 0;
            centrifugacao <= 0;
            porta_fechada <= 1;
            ciclo_contador <= 0; 
            atraso_contador <= 0;
            estado_atual <= ESPERA; 
        end else begin
            case (estado)
                ESPERA: begin
                    porta_fechada <= 0;
                    if (botao_iniciar) begin
                        porta_fechada <= 1;
                        if (atraso_minutos > 0) begin
                            estado <= ATRASO;
                            atraso_contador <= atraso_minutos; 
                        end else begin
                            estado <= ENTRADA_AGUA;
                        end
                    end
                   estado_atual <= ESPERA; 
                end
                ATRASO: begin
                    if (atraso_contador > 0) begin 
                        atraso_contador <= atraso_contador - 1; 
                    end else begin
                       estado <= ENTRADA_AGUA; 
                    end
                    estado_atual <= ATRASO;
                end
                ENTRADA_AGUA: begin
                    entrada_agua <= 1;
                    ciclo_contador <= ciclo_contador + 1;
                    if (ciclo_contador == 1) begin
                        estado <= AQUECIMENTO;
                        ciclo_contador <= 0;
                        entrada_agua <= 0; 
                    end
                   estado_atual <= ENTRADA_AGUA; 
                end
                AQUECIMENTO: begin
                    aquecimento <= 1;
                    ciclo_contador <= ciclo_contador + 1;
                    if (ciclo_contador == 8) begin
                        estado <= DETERGENTE;
                        ciclo_contador <= 0;
                        aquecimento <= 0; 
                    end
                    estado_atual <= AQUECIMENTO; 
                end
                DETERGENTE: begin
                    detergente <= 1;
                    ciclo_contador <= ciclo_contador + 1;
                    if (ciclo_contador == 1) begin
                        estado <= LAVAGEM;
                        ciclo_contador <= 0;
                        detergente <= 0; 
                    end
                    estado_atual <= DETERGENTE; 
                end
                LAVAGEM: begin
                    lavagem <= 1;
                    ciclo_contador <= ciclo_contador + 1;
                    if (ciclo_contador == 5) begin
                        estado <= ENXAGUAR;
                        ciclo_contador <= 0;
                        lavagem <= 0; 
                    end
                   estado_atual <= LAVAGEM; 
                end
                ENXAGUAR: begin
                    enxaguar <= 1;
                    ciclo_contador <= ciclo_contador + 1;
                    if (ciclo_contador == 5) begin
                        estado <= CENTRIFUGACAO;
                        ciclo_contador <= 0;
                        enxaguar <= 0;
                    end
                   estado_atual <= ENXAGUAR; 
                end
                CENTRIFUGACAO: begin
                    centrifugacao <= 1;
                    ciclo_contador <= ciclo_contador + 1;
                    if (ciclo_contador == 5) begin
                        estado <= FIM;
                        ciclo_contador <= 0;
                        centrifugacao <= 0; 
                    end
                   estado_atual <= CENTRIFUGACAO; 
                end
                FIM: begin
                    porta_fechada <= 0; 
                    estado_atual <= FIM; 
                end
            endcase
        end
    end
endmodule