    AREA    RESET, DATA, READONLY
    EXPORT  __Vectors
__Vectors
    DCD     0x10001000
    DCD     Reset_Handler
    ALIGN
    EXPORT  Reset_Handler
Reset_Handler
    LDR     R0, =ARR
    MOV     R1, #0 ; I = 0
LOOP
    LDR     R2, [R0]
    CMP     R2, #0
    BGE     NON_NEGATIVE

    RSB     R2, R2, #0
    STR     R2, [R0]
    ADD     R1, R1, #1
    CMP     R1, #5
    BLO     LOOP
NON_NEGATIVE
    ADD     R0, R0, #4
    ADD     R1, R1, #1
    CMP     R1, #5
    BLO     LOOP

    AREA    DATASEG, DATA, READWRITE
ARR     DCD     10, 30, 20, 50, 40
    END