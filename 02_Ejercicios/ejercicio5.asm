; COMPUTADORES II - USAL
; SEGUNDA SESIÓN
; ejercicio5.asm

        .area PROG (ABS)

; Constante 'fin'
fin     .equ 0xFF01

        .org 0x100

; Variables
word1: .word 0x2198
byte1: .byte 0x01
byte2: .byte -2

        .globl programa
programa:
	; Suma sin signo
        ldx word1
	ldb byte1
	abx	

	; Suma con signo
	ldb byte2
	sex 			; El dato negativo ya está en el registro D
	addd word1

        ; Fin del programa 
        clra
        sta fin

        .org 0xFFFE     ; vector de RESET
        .word programa