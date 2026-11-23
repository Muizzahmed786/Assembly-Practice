    AREA    RESET, DATA, READONLY
    EXPORT  __Vectors
__Vectors
    DCD     0x10001000
    DCD     Reset_Handler
    ALIGN
    EXPORT  Reset_Handler
Reset_Handler
    LDR     R0, =A
    LDR     R0, [R0] ; A
    LDR     R1, =B
    LDR     R1, [R1] ; B
LOOP
    CMP     R0, R1
    BEQ     EXIT

    BGT     SUBTRACT_A
    SUB     R1, R1, R0
    B       LOOP
SUBTRACT_A
    SUB     R0, R0, R1
    B       LOOP
EXIT
    LDR     R2, =RESULT
    STR     R0, [R2]
STOP
    B       STOP

    AREA    DATASEG, DATA, READWRITE
A   DCD     0x05
B   DCD     0x02