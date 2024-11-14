module core (
    input wire clk,                // Тактовый сигнал
    input wire reset,              // Сигнал сброса     
	 output reg [6:0] HEX1
    output reg [6:0] HEX0
    output reg [6:0] HEX2	 // Светодиоды для отображения результата
);

    reg [31:0] command_reg;         // Командный регистр
    reg [11:0] pc;                  // Счётчик команд (Program Counter)
    reg [31:0] command_memory [0:4095]; // Память команд (16 команд по 4 бита)

    initial begin
        // Инициализация памяти команд (можно заполнить вручную)
        command_memory[0] = 4'b0001; // Пример команды
        command_memory[1] = 4'b0010; // Пример команды
        // Остальные команды можно заполнить по необходимости
    end
    SEG7_LUT shema_vs (.oSEG(HEX0[6:0]) ,.iDIG(pc[3:0]) )
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            pc <= 0;                // Сброс счётчика команд
                    // Сброс светодиодов
        end else begin
            command_reg <= command_memory[pc]; // Считываем команду из памяти
            pc <= pc + 1;           // Увеличиваем счётчик команд

            case (command_reg)
                4'b0001: leds <= 4'b0001; // Пример команды: зажечь светодиод 0
                4'b0010: leds <= 4'b0010; // Пример команды: зажечь светодиод 1
                // Добавьте другие команды здесь
                default: leds <= 4'b0000; // NOP: ничего не делать
            endcase
        end
    end

endmodule