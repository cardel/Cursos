.model small
ORG    100h
  
  
MOV    AL, 0
MOV    CL, CICLO
MOV    BL, 0

CALL ciclo
RET

ciclo PROC
	CMP	CL,CONSTANTE 
        JG	sumanumero  ; Si es mayor llama a sumaNumero
        JE  	continuar   ; Si es igual continua
	RET
ciclo ENDP

continuar PROC
	CALL   imprimirTexto
	CALL   imprimirResultado
	RET                   
continuar ENDP




sumaNumero     PROC
	MOV AL,A
	ADD AL,B
	ADD BL,AL
	DEC CL
	CALL ciclo
	RET                   
sumaNumero     ENDP

imprimirTexto PROC

	
	MOV AX, SEG TEXTO
	MOV DS,AX
	LEA DX, TEXTO
	MOV AH,9
	INT 21h
	
	RET

imprimirTexto ENDP

imprimirResultado PROC
	;El resultado es 21 por lo que se debe mostrar el resultado de la division por 10
	MOV AL,0
	MOV AH,0
	MOV AL,BL ; Cargar resultado almacenado
	MOV BL,DIVISOR
	DIV BL ;Resultado en AL, resto en AH

	;Almacenar resultado
	MOV BH,AH
	MOV BL,AL

	;Cargar resultado en AL
	MOV AL,BL
	ADD AL,30h
	MOV DH, 0
	MOV DL, AL
	MOV AH, 02h
	INT 21h

	;Cargar resto en AL
	MOV AL,BH
	ADD AL,30h
	MOV DH, 0
	MOV DL, AL
	MOV AH, 02h
	INT 21h

	RET

imprimirResultado ENDP



A EQU 2
B EQU 5
CR EQU 13
LF EQU 0
DIVISOR EQU 10
CICLO EQU 3
CONSTANTE EQU 0
TEXTO DB 'EL RESULTADO DE 3*(2+5) ES:$',CR,LF
END

