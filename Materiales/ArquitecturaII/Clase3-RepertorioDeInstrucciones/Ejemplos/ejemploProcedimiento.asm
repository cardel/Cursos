.model small
ORG    100h
  
  
MOV    BL, 2
MOV    BH, 5
MOV    AL, 0
CALL   sumaNumero  
CALL   sumaNumero  
CALL   sumaNumero 
MOV    BL,AL ;Guardar Resultado temporalmente
CALL   imprimirTexto
CALL   imprimirResultado



RET                   

sumaNumero     PROC
	ADD AL,BL
	ADD AL,BH
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
	MOV AL,BL 
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

CR EQU 13
LF EQU 0
DIVISOR EQU 10
TEXTO DB 'EL RESULTADO DE 3*(2+5) ES:$',CR,LF
END

