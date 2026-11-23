    AREA    RESET, DATA, READONLY
    EXPORT  __Vectors
__Vectors
    DCD     0x10001000
    DCD     Reset_Handler
    ALIGN
    EXPORT  Reset_Handler
Reset_Handler
    LDR     R0, =ARR
    MOV     R1, #1 ; I = 1
OUTER_LOOP
    LDR     R2, [R0, R1, LSL #2] ; KEY = ARR[I]
    SUB     R3, R1, #1 ; J = I - 1
INNER_LOOP
    CMP     R3, #0
    BLE     INSERT

    LDR     R4, [R0, R3, LSL 32] ; ARR[J]
    CMP     R4, R2
    BLE     INSERT

    ADD     R5, R3, #1 ; J = J + 1
    STR     R4, [R0, R5, LSL #2]
    SUB     R3, R3, #1 ; J--
    B       INNER_LOOP
INSERT
    ADD     R5, R3, #1
    STR     R2, [R0, R5, LSL #2]; ARR[J+1] = KEY
    ADD     R1, R1, #1 ; I++
    CMP     R1, #5
    BLO     OUTER_LOOP
STOP
    B       STOP

    AREA    DATASEG, DATA, READWRITE
ARR     DCD     10, 30, 20, 50, 40
    END