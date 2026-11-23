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
HUNDEREDS
    CMP     R1, #100
    BLO     TENS

    SUB     R1, R1, #100
    ADD     R2, R2, #1
    B       HUNDEREDS
TENS
    CMP     R1, #10
    BLO     PACK

    SUB     R1, R1, #10
    ADD     R3, R3, #1
    B       TENS
PACK
    LSL     R2, R2, #8
    LSL     R3, R3, #4
    ORR     R4, R2, R3
    ORR     R4, R4, R1

STOP
    B       STOP

    AREA    DATASEG, DATA, READWRITE
NUM     DCD     0xFF ; 255
    END