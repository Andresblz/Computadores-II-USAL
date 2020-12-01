; COMPUTADORES II - USAL
; OCTAVA SESIÓN
; ejercicio2.asm

	.area PROG(ABS)

; Constantes
pantalla .equ 0xFF00
fin	 .equ 0xFF01
teclado  .equ 0xFF02
pilaU	 .equ 0xF000
pilaS	 .equ 0xE000
	
	.org 0x100

; Variables
prefijo: .asciz "0x"

	.globl programa
programa: 
	lds #0xFF00
	lda #32

	ldx #prefijo
	bsr imprimeCadena

	tsta
	beq segundaCifra
	tfr a,b
	lsrb
	lsrb
	lsrb
	lsrb
	bsr imprimeCifraHexa

segundaCifra:
	tfr a,b
	andb #0b1111
	bsr imprimeCifraHexa
	
	ldb #'\n
	stb pantalla
	
	clra
	sta fin

;---------------------------------------------------------;
; IMPRIME CADENA					  					  ;
;							  							  ;
; Codigo para imprimir cadenas de caracteres.		  	  ;
;							  							  ;
; Entrada: X (direccion cadena imprimir)		  	 	  ;
; Salida: No						  					  ;
; Registros afectados: X, A, CC				  			  ;
; Registros afectados por subrutinas: No		  		  ;
;---------------------------------------------------------;
imprimeCadena:
	pshs a
sgte:	lda ,x+
	cmpa #'\n
	beq finImprimeCadena
	sta pantalla
	bra sgte
finImprimeCadena:
	puls a,pc

;---------------------------------------------------------;
; IMPRIME CIFRA HEXADECIMAL				     			  ;
;							  							  ;
; Codigo para imprimir cifra hexadecimal contenida en B	  ;
;							  							  ;
; Entrada: B (cifra hexadecimal del 0 al 15)		 	  ;
; Salida: No						  					  ;
; Registros afectados: B, CC				  			  ;
; Registros afectados por subrutinas: No		  		  ;
;---------------------------------------------------------;
imprimeCifraHexa:
	cmpd #10
	blo decimal
	addb #'A-'9-1

	decimal:
		addb #'0
		stb pantalla
		rts


	.org 0xFFFE
	.word programa