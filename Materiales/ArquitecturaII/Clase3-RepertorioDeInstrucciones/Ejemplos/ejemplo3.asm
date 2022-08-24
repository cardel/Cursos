.model small
ORG 100h

;Multiplicacion 2*10*10

CR EQU 13
LF EQU 0
A EQU 2
B EQU 10
C EQU 10
DIVISOR EQU 100
DIVISORMENOR EQU 10

.DATA
	TEXTO DB 'EL RESULTADO ES:',CR,LF


.CODE

	MOV AX, SEG TEXTO ;Mover AX direccion segmento de texto
	MOV DS,AX; Mover direccion del texto a DS
	LEA DX, TEXTO; Cargar direccion fin del texto 
	MOV AH,9; Comando 9 de la interrupcion
	INT 21h


	MOV BX,A
	MOV AX,B
	MUL BX; AX = AX*BX
	MOV BX,C
	MUL BX

	MOV BX,AX
	MOV CX, DIVISOR
	DIV CX

	MOV CL,AL ;AL esta el cociente
	MOV CH,AH ;AH esta el residuo	
	

	;Mostramos el digito mas significativo
	MOV AL, CL
	ADD AL,30h ;Sumo 30h (48) codigo ascii
	MOV DH, 0
	MOV DL, AL ; Lo que va a mostrar la interrupcion
	MOV AH, 02h ; En AH esta guardando el codigo de la interrupcion
	INT 21h ; Ejecutando la interrupcion
	

	;Mostramos el segundo digito
	;Debemos tomar el residuo y divirlo entre 10

	

	MOV AH, 0h  ; Limpio A
	MOV AL, CH  ; El residuo lo tenia en CH

	MOV CL, DIVISORMENOR
	DIV CL

	MOV CL, AL ; Cociente
	MOV CH, AH ; Residuo

	MOV AL, CL ; Muevo cociente a AL
	ADD AL, 30h ; Convirtiendo en Codigo ASCII

	MOV DH,0
	MOV DL, AL
	MOV AH, 02h
	INT 21h	


	; Tomamos el residuo final

	MOV AL, CH ; Muevo residuo a AL
	ADD AL, 30h ; Convirtiendo en Codigo ASCII

	MOV DH,0
	MOV DL, AL
	MOV AH, 02h
	INT 21h	
END
