    AREA    RESET, DATA, READONLY
    EXPORT  __Vectors
__Vectors
    DCD     0x10001000
    DCD     Reset_Handler
    ALIGN
    AREA    mycode, CODE, READONLY
    EXPORT  Reset_Handler
Reset_Handler
    LDR     R0, =DIVIDEND ; DIVIDEND BECOMES REMAINDER, AS IT WILL REPEATEDLY SUBTRACTED
    LDR     R1, [R0]

    LDR     R0, =DIVISOR ; 16 BIT DIVISOR
    LDR     R2, [R0]

    MOV     R3, #0 ; COUNTER WILL BECOME THE QUOTIENT
LOOP
    CMP     R1, R2
    BLO     DONE

    SUB     R1, R1, R2
    ADD     R3, R3, #1
    B       LOOP
DONE
    LDR     R0, =RESULT
    STR     R3, [R0]
    STR     R3, [R0, #4]