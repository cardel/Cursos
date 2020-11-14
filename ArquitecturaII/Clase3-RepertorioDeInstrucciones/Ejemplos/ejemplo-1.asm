.model small
.stack 100h
CR EQU 13
LF EQU 0
.DATA
	TEXTO DB 'HOLA$',CR,LF

.CODE
	MOV AX, SEG TEXTO
	MOV DS,AX
	LEA DX, TEXTO
	MOV AH,9
	INT 21h

	MOV AH,4ch
	INT 21h
END

