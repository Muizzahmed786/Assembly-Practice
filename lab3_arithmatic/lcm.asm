    AREA    RESET, DATA, READONLY
    EXPORT  __Vectors
__Vectors
    DCD     0x10001000
    DCD     Reset_Handler
    ALIGN
    EXPORT  Reset_Handler
Reset_Handler
    LDR     R0, =NUM1
    LDR     R1, [R0] ; A
    LDR     R0, = NUM2
    LDR     R2, [R0] ; B

    MOV     R3, #1 ; I

OUTER_LOOP
    MUL     R4, R3, R1
DIVIDE
    CMP     R4, R2
    BLO     NEXT

    SUB     R4, R4, R2
    B       DIVIDE
NEXT
    CMP     R4, #0
    BEQ     FOUND

    ADD     R3, R3, #1
    B       OUTER_LOOP
FOUND
    MOV     R5, R4
    LDR     R0, =RESULT
    STR     R5, [R0]
STOP
    B       STOP