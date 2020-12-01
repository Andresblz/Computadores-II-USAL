; COMPUTADORES II - USAL
; SEGUNDA SESIÓN
; ejercicio4.asm

        .area PROG (ABS)

; Constante 'fin'
fin     .equ 0xFF01

        .org 0x100

; Variables
variable1: .word 0x2196
variable2: .word 0x0002

resta1:  .word 0
resta2:  .word 0

        .globl programa
programa:
        ; Suma con el registro 'D'
        ldd variable1
        subd variable2
        std resta1

        ; Suma con el registro 'A'
        lda variable1+1
        suba variable2+1
        sta resta2+1
        lda variable1
        sbca variable2
        sta resta2

        ; Fin del programa
        clra
        sta fin

        .org 0xFFFE     ; vector de RESET
        .word programa