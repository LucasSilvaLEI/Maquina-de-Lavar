Esse projeto simula o funcionamento de uma máquina de lavar roupa utilizando Verilog, implementado no ISE Xilinx.

Objetivo Principal:
O objetivo é criar uma máquina de lavar virtual utilizando uma máquina de estados finita (FSM) para controlar o comportamento do sistema, que inclui estados como lavagem, enxágue, e centrifugação. A máquina de estados é controlada por entradas, como os botões de iniciar, pausar, e resetar.

Estrutura do Projeto:
Máquina de Estados: A máquina de lavar é modelada com uma FSM que tem como estados principais:


Este projeto tem como objetivo desenvolver um controlador para uma máquina de lavar roupa,
implementado por uma máquina de estados .
O sistema é controlado por um ciclo de operações fixo, que inclui, a entrada de água, o aquecimento,
a entrada de detergente, a lavagem, o enxaguamento, a centrifugação e abertura da porta. A máquina
será comandada por um ciclo de clock e irá realizar diferentes ações dependendo do estado atual do
processo de lavagem.

O sistema foi organizado para executar todas as etapas essenciais de um ciclo de lavagem, que são:
• Entrada de Água: Nesta etapa, a máquina controla o fluxo de água para garantir o enchimento
correto do tambor.
• Aquecimento: O sistema realiza o aquecimento da água, ajustando a temperatura conforme o
tipo de lavagem configurado.
• Detergente: A libertação do detergente ocorre de forma sincronizada após o aquecimento da
água.
• Lavagem: A agitação do tambor inicia-se nesta fase, realizando o processo de lavagem
propriamente dito. O tempo e intensidade são ajustados conforme a configuração do ciclo.
• Enxaguar: Após a lavagem, a máquina inicia um ciclo de enxaguamento para remover restos
do detergente.
• Centrifugação: Nesta fase, o tambor gira em alta velocidade para remover o excesso de água
das roupas.
• Porta: A máquina mantém a porta fechada durante o ciclo de lavagem, abrindo-a somente após
acabar por completo o processo.

O projeto incorpora duas funcionalidades extras para aumentar a segurança e a praticidade do sistema:
• Modo de Proteção para Falta de Energia Elétrica: Implementado para evitar perda de progresso em caso de interrupção de energia. A máquina é capaz de retomar o ciclo do ponto exato
onde foi interrompida, preservando tanto o equipamento quanto as roupas.
• Atraso de Início de Lavagem: Esta funcionalidade permite que o utilizador programe um atraso
para o início do ciclo de lavagem, oferecendo flexibilidade para agendar o uso do equipamento
em horários mais convenientes, como durante períodos de menor consumo de energia elétrica.



Simulação no ISE Xilinx:
O ISE Xilinx é uma ferramenta de desenvolvimento para a criação de projetos em FPGA usando Verilog. A simulação do projeto envolve a verificação do comportamento da máquina de lavar em diferentes condições de entrada. As simulações podem ser realizadas para testar os seguintes casos:

Iniciar o ciclo de lavagem e transitar entre os estados conforme os sinais de controle.
Pausar o ciclo e verificar se o estado retorna para o modo inicial.
Verificar a transição entre os estados, como da lavagem para o enxaguamento, e do enxaguamento para a centrifugação.
Detalhes da Implementação:
FSM: A máquina de estados é construída usando um bloco always que monitora os sinais de clk (clock) e reset para determinar as transições entre os estados. A lógica dos estados é simples e segue as regras do ciclo de lavagem.
Estados e Saídas: Cada estado da FSM define as saídas correspondentes (como lavando, enxaguando e centrifugando). Isso é feito por meio de um bloco always @(*), que define as saídas com base no estado atual.
Transições: As transições entre os estados acontecem com base nos sinais de start e pause, onde o estado de transição é determinado pela lógica condicional dentro do bloco de transição de estados.

Vantagens do Projeto:
Controle Digital: A máquina de lavar é controlada digitalmente por uma máquina de estados finita (FSM), o que facilita a implementação e simulação do funcionamento do sistema.

Simulação Realista:
 A simulação no ISE Xilinx permite observar o comportamento do projeto antes de implementar em hardware real, garantindo que as transições de estado e as saídas sejam corretamente gerenciadas.
Expansibilidade: O código é modular, e você pode facilmente adicionar funcionalidades como controle de temperatura, sensores de carga, ou até mesmo uma interface de controle mais avançada.
Possíveis Expansões:

Temporização:
Para um controle mais realista, seria possível adicionar temporizadores para controlar o tempo de cada fase do ciclo (lavagem, enxágue, centrifugação).
Módulo de Aquecimento: Poderia ser implementado um módulo para controlar a temperatura da água.
Interface de Usuário: Para um controle mais interativo, uma interface (como um display 7-segmentos ou LEDs) poderia ser adicionada para mostrar o estado atual do ciclo.

Conclusão:
Esse projeto de máquina de lavar implementado em Verilog no ISE Xilinx é um excelente exemplo de como simular sistemas reais com lógica digital. Ele combina conceitos de máquinas de estados finitas com a simulação em FPGA, sendo uma ótima aplicação para aprendizado e para sistemas embarcados.
