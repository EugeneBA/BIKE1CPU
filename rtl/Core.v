module Core 
(
    input wire clk,                // Тактовый сигнал
    input wire reset,              // Сигнал сброса     
	 
	 output reg [7:0] outLedG,
	 output reg [9:0] outLedR,
	 
	 output reg [6:0] out7Seg0,
    output reg [6:0] out7Seg1,
    output reg [6:0] out7Seg2,
	 output reg [6:0] out7Seg3
	 
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
    SEG7_LUT shema_vs (.oSEG(out7Seg0[6:0]) ,.iDIG(pc[3:0]));
	 
	 
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            pc <= 0;                // Сброс счётчика команд
                    // Сброс светодиодов
        end else begin
            command_reg <= command_memory[pc]; // Считываем команду из памяти
            pc <= pc + 1;           // Увеличиваем счётчик команд

            case (command_reg)
                4'b0001: outLedG <= 4'b0001; // Пример команды: зажечь светодиод 0
                4'b0010: outLedG <= 4'b0010; // Пример команды: зажечь светодиод 1
                // Добавьте другие команды здесь
                default: outLedG <= 4'b0000; // NOP: ничего не делать
            endcase
        end
    end

endmodule