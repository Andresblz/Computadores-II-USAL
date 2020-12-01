; COMPUTADORES II - USAL
; PRIMERA SESIÓN
; ejercicio10.asm

.area PROG (ABS)

    .org 0x100
    .globl programa
        
programa:
	lda 0xFF02	; Lee primer caracter
	ldb 0xFF02	; Lee segundo caracter
	
	stb 0xFF00	; Muestra segundo caracter
	sta 0xFF00	; Muestra primer caracter
	
	; Salto de linea
	ldb #'\n	
	stb 0xFF00
	
acabar:
        sta 0xFF01		; Muestra por pantalla el codigo ascii del primer caracter

        .org 0xFFFE    
        .word programa