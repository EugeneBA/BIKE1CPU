# BIKECPU
## Архитектура
- Размер данных: 32 бита;
- Размер команд: 32 бита;
- Адресация команд и данных: 16 бит
- Регистры: A,B,C,D,E;
### Команды
https://metanit.com/assembler/tutorial/

| Команда          |    4 |    3 |     2 |     1 | Описание    |
| :--------------- | ---: | ---: | ----: | ----: | ----------- |
| NOP              | 0x00 | 0x00 |  0x00 |  0x00 |             |
|                  |      |      |       |       |             |
| MOV R1, R2       | 0x01 | 0x00 | [RN1] | [RN2] |             |
| MOV R, MEM       | 0x02 | [RN] |  [A2] |  [A1] |             |
| MOV MEM, R       | 0x03 | [RN] |  [A2] |  [A1] |             |
| MOV MemAinR1, R2 | 0x01 | 0x01 | [RN1] | [RN2] |             |
| MOV R1, MemAinR2 | 0x01 | 0x02 | [RN1] | [RN2] |             |
| MOV V low, R     | 0x04 | 0x00 |    V2 |    V1 |             |
| MOV V high, R    | 0x04 | 0x01 |    V4 |    V3 |             |
|                  |      |      |       |       |             |
| ADD R, R1, R2    | 0x10 | [RN] | [RN1] | [RN2] | R = R1 + R2 |
| SUB R, R1, R2    | 0x11 | [RN] | [RN1] | [RN2] | R = R1 - R2 |
| NEG R1, R2       | 0x12 | 0x00 | [RN1] | [RN2] | R1 = R2     |
| MUL R, R1, R2    | 0x13 | [RN] | [RN1] | [RN2] | R = R1 * R2 |
| DIV R, R1, R2    | 0x14 | [RN] | [RN1] | [RN2] | R = R1 / R2 |
|                  |      |      |       |       |             |
| JMP A            | 0x20 | 0x00 |  [A2] |  [A1] |             |
|                  |      |      |       |       |             |
| CMP R1, R2       | 0x21 | 0x00 | [RN1] | [RN2] |             |
| J[F] A           | 0x22 |  [F] |  [A2] |  [A1] |             |
|                  |      |      |       |       |             |
| AND R, R1, R2    | 0x30 | [RN] | [RN1] | [RN2] |             |
| OR R, R1, R2     | 0x31 | [RN] | [RN1] | [RN2] |             |
| XOR R, R1, R2    | 0x32 | [RN] | [RN1] | [RN2] |             |
| NOT R1, R2       | 0x33 | 0x00 | [RN1] | [RN2] |             |
|                  |      |      |       |       |             |
| SHL R1, R2       | 0x40 | 0x00 | [RN1] | [RN2] |             |
| SHR R1, R2       | 0x41 | 0x00 | [RN1] | [RN2] |             |

### Version 0
1. NOP
2. MOV A, R
3. MOV R, A
4. MOV V low, A
5. MOV V high, A
6. ADD A, R1, R2
7. SUB A, R1, R2
8. JMP A
