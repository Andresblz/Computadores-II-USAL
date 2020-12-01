; COMPUTADORES II - USAL
; QUINTA SESIÓN
; ejercicio2.asm

	.area PROG (ABS)

; Constantes       
pantalla .equ 0xFF00
fin      .equ 0xFF01
teclado	 .equ 0xFF02

	.org 0x100

; Variables
num:	.word  0

	.globl programa
programa:
	; Leemos un numero entre '0' y '50000'
	ldb teclado
	subb #'0
	
	lda #50
	mul
	
	lda #200
	mul
	
	std num
	
	ldb teclado
	subb #'0
	
	lda #50
	mul
	
	lda #20
	mul
	
	addd num
	std num
	
	ldb teclado
	subb #'0
	
	lda #100
	mul
	
	addd num
	std num
	
	ldb teclado
	subb #'0
	
	lda #10
	mul
	
	addd num
	std num
	
	ldb teclado
	subb #'0
	
	addd num
	std num

	; Limpiamos el contenido de 'a' y 'b'
	clra
	clrb

bucle:
	; Movemos el contenido de 'd' a 'x'
	tfr d,x
	mul
	; Comparamos el numero introducido
	cmpd num

	; En caso de que sea igual entra en 'true'
	; Si por el contrario es mayor entra en 'false'
	beq true
	bhi false

	; Un ultimo caso posible es si el numero es menor,
	; en este caso movemos el contenido de 'x' a 'd'
	; despues incrementamos 'a' y 'b' y volvemos a 'bucle'
	tfr x,d
	inca
	incb
	bra bucle

true:
	ldb #'\n
        stb pantalla
	lda #'S
	sta pantalla
	lda #'I
	sta pantalla
	ldb #'\n
        stb pantalla
	bra acabar

false:
	ldb #'\n
        stb pantalla
	lda #'N
	sta pantalla
	lda #'O
	sta pantalla
	ldb #'\n
        stb pantalla
	bra acabar

acabar:				; Fin del programa
	clra
	sta fin

	.org 0xFFEE		; Vector de RESET
	.word programa