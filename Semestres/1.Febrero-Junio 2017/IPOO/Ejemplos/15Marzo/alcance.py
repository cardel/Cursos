#
 # Autor: Carlos A Delgado
 # Archivo: Ejemplo1.cpp
 # Descripcion: Ejemplo retorno void
 # Fecha: 15-Marzo-2017
 #

def funcion(a, b):
	c = a + b
	global d
	d = 2*c
	return c

#print(d) error porque no ha sido declarada

#no existe d
print(funcion(1,2))
#si existe d

print(d)
