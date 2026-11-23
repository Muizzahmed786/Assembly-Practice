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

    LSR     R2, R1, #4 ; 3
    AND     R3, R1, #0x0F ; A

    ; convert higher digit
    CMP     R2, #10
    BLO     HIGH_DIGIT
    ADD     R2, R2, #7
HIGH_DIGIT  
    ADD     R2, R2, #0x30

    CMP     R3, #10
    BLO     LOW_DIGIT
    ADD     R3, R3, #7
LOW_DIGIT
    ADD     R3, R3, #0x30

STOP
    B       STOP

    AREA    DATASEG, DATA, READWRITE
NUM     DCD     0x3A
    END

