# encoding: utf-8
#Autor: Carlos A Delgado
#Ejemplo de una red competitiva

import numpy as np

def redNeuronal(entrada, pesos):
	"""
	Entrada: [x1,x2,...xn]
	pesos Matriz m filas y n columnas
	"""
	Theta = 0.5*np.sum(np.power(pesos,2),axis=1)
	h = np.dot(pesos, entrada) - Theta
	
	r = np.argmax(h)
	
	z = np.zeros(pesos.shape[0])
	z[r] = 1
	
	return h,r,z

entrada = np.array(
	[
		[0,0],
		[0,1],
		[1,0],
		[1,1]
	]
)

M = 2
pesos = 2*np.random.rand(M, entrada.shape[1])-1

for entradaI in entrada:
	h,r,z = redNeuronal(entradaI, pesos)
	print z,h,r
