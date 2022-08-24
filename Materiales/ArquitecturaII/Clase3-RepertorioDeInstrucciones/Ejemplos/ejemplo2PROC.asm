
org 100h
mov ah, 1 ;Leer un caracter de la entrada estandar
int 21h ;Llamada al sistema operativo (DOS)
mov tecla, al
mov ah, 2 ;imprime un simbolo a la consola
mov dl, simbolo ;el caracter a mostrar, en este caso la E
int 21h ;Llamada al DOS

inc tecla
mov ah, 7 ;NO imprime un simbolo a la consola
mov dl, tecla ; 
int 21h ;Llamada al DOS

ret
;Variables
tecla db 0 
simbolo db 45H
;ah que queres hacer
;ah = 1 guarda caracter en al
;ah = 2 escribe un caracter en la consola. El ascii del cacacter a imprimir se pone el dl
;AH = 7 es igual a el ah=2 pero el resultado no se ve en pantalla 
;ah = 9 imprime una cadena en la consola. Considera el caracter $ como fin de cadena.
;La direccion de la cadena se expresa en DX