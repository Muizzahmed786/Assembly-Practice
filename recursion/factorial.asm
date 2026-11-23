    AREA    RESET, DATA, READONLY
    EXPORT  __Vectors
__Vectors
    DCD     0x10001000
    DCD     Reset_Handler
    ALIGN
    EXPORT  Reset_Handler
Reset_Handler
    LDR     R1, =NUM
    LDR     R0, [R1] ; R0 = n

    BL      FACTORIAL ; R0 = factorial(n)

    LDR     R1, =RESULT
    STR     R0, [R1]
FACTORIAL
    CMP     R0, #1
    BLS     BASE_CASE

    PUSH    {R0, LR}
    SUB     R0, R0, #1
    BL      FACTORIAL

    POP     {R1, LR}
    MUL     R0, R0, R1
    BX      LR
BASE_CASE
    MOV     R0, #1
    BX      LR
