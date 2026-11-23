    AREA    RESET, DATA, READONLY
    EXPORT  __Vectors
__Vectors
    DCD     0x10001000
    DCD     Reset_Handler
    ALIGN
    AREA    mycode, CODE, READONLY
    EXPORT  Reset_Handler

Reset_Handler
    LDR     R0, =SRC
    LDR     R1, =DST
    MOV     R2, 0

LOOP
    LDR     R3, [R0], #4
    STR     R3, [R1], #4
    SUBS    R2, R2, #1
    BNE     LOOP
STOP
    B       STOP
    