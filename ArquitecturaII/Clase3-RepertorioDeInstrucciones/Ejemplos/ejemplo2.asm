.model small
.stack 100h
A EQU 3
B EQU 3
C EQU 1
CR EQU 13
LF EQU 0

.DATA
	TEXTO DB 'EL RESULTADO DE 3*3 + 1 ES:$',CR,LF
.CODE
	;Calcular 3*2 + 1
	MOV AL,A
	MOV BL,B
	MUL BL
	ADD AL,C
	MOV BL,AL


	MOV AX, SEG TEXTO
	MOV DS,AX
	LEA DX, TEXTO
	MOV AH,9
	INT 21h

	;Mostrar numero
	MOV AX,0
	MOV AL,BL
	;Convertir en codigo ASCII
	ADD AL,30h
	MOV DH, 0
	MOV DL, AL
	MOV AH, 02h
	INT 21h


	MOV AH, 4ch
	INT 21h


END