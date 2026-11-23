    AREA    RESET, DATA, READONLY
    EXPORT  __Vectors
__Vectors
    DCD     0x10001000
    DCD     Reset_Handler
    ALIGN
    EXPORT  Reset_Handler
Reset_Handler
    MOV     R0, #5 ; FIBONACCI OF 5
    BL      FIBONACCI
FIBONACCI
    CMP     R0, #0
    BEQ     BASE_CASE

    CMP     R0, #1
    BEQ     BASE_CASE

    PUSH    {R0, LR}
    SUB     R0, R0, #1
    BL      FIBONACCI

    MOV     R1, R0
    POP     {R0, LR}
    PUSH    {R1, LR}

    SUB     R0, R0, #2
    BL      FIBONACCI

    POP     {R1, LR}
    ADD     R0, R0, R1
    BX      LR
BASE_CASE
    MOV     R0, #0
    BX      LR
STOP
    B       STOP
