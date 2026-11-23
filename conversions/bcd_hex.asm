    AREA    RESET, DATA, READONLY
    EXPORT  __Vectors
__Vectors
    DCD     0x10001000
    DCD     Reset_Handler
    ALIGN
    AREA    mycode, CODE, READONLY
    EXPORT  Reset_Handler
Reset_Handler
    LDR     R0, =NUM
    LDR     R1, [R0]

    ; GET HUNDEREDS DIGIT
    LSR     R2, R1, #8
    AND     R2, R2, #0x0F

    ; GET TENS DIGIT
    LSR     R3, R1, #4
    AND     R3, R3, #0x0F

    ; GET UNITS DIGIT
    AND     R4, R1, #0x0F

    ; HUNDEREDS
    MOV     R5, #100
    MUL     R2, R2, R5

    ; TENS
    MOV     R6, #10
    MUL     R3, R3, R6

    ; ADD ALL DIGITS
    ADD     R7, R2, R3
    ADD     R8, R7, R4
STOP
    B       STOP

    AREA    DATASEG, DATA, READWRITE
NUM     DCD     0x453
    END