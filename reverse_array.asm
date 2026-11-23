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
    MOV     R2, #5
    MOV     R1, R0, #36
LOOP
    LOAD    R3, [R0]
    LOAD    R4, [R1]

    STR     R3, [R1]
    STR     R4, [R0]

    ADD     R0, R0, #4
    SUB     R1, R1, #4

    SUBS    R2, R2, #1
    BNE     LOOP
STOP
    B       STOP


    AREA    DATASEG, DATA, READWRITE
ARR     DCD     10, 20, 30, 40, 50, 60, 70, 80, 90
    END

