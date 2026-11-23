    AREA    RESET, DATA, READONLY
    EXPORT  __Vectors
__Vectors
    DCD     0x10001000
    DCD     Reset_Handler
    ALIGN
    EXPORT  Reset_Handler
Reset_Handler
    LDR     R0, =ARR
    MOV     R1, #0 ; I = 0
OUTER_LOOP
    MOV     R2, #0 ; J = 0
    MOV     R3, #4 ; N - 1 = 4
    SUB     R3, R3, #1 ; N - I - 1
INNER_LOOP
    LDR     R4, [R0, R2, LSL #2] ; ARR[J]
    MOV     R6, R2, #1 ; J + 1
    LDR     R5, [R0, R2, LSL #2] ; ARR[J+1]

    CMP     R4, R5
    BLS     NEXT ; IF ARR[J] <= ARR[J+1], NO SWAP

    STR     R5, [R0, R2, LSL #2]
    STR     R4, [R0, R2, LSL #2]
NEXT
    ADD     R2, R2, #1
    CMP     R2, R3
    BLS     INNER_LOOP

    ADD     R1, R1, #1
    CMP     R1, #4
    BLS     OUTER_LOOP
STOP
    B       STOP

    AREA    DATASEG, DATA, READWRITE
ARR     DCD     10, 30, 20, 50, 40
    END