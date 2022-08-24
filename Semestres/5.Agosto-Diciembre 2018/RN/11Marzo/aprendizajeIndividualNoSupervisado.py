# encoding: utf-8
#Autor: Carlos A Delgado
#Ejemplo de una red competitiva

import numpy as np
import math

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

def entrenamientoIndividualizado(entradas, M, factorEntre, maxIT, P):
	"""
		entradas: vector 2D
		M: entero (número de salidas)
		factorEntre: float
		maxIT: entero (número máximo de iteraciones)
		P: numero de patrones P <= M
	"""
	pesos = 2*np.random.rand(M, entrada.shape[1])-1
	
	factorApreInicial = factorEntre
	indices = np.random.permutation(entradas.shape[0])
	patron = 0
	
	for i in range(0,maxIT):
		
		posicion = indices[patron]
		entradaI = entrada[posicion]
	
		h,r,z = redNeuronal(entradaI, pesos)
		
		#r es mi neurona ganadora 0 - m-1
		for j in range(0, pesos.shape[1]):
			pesos[r][j] = pesos[r][j] + factorEntre*(entradaI[j]-pesos[r][j])
		
		factorEntre =  factorApreInicial*(1-i/maxIT)
		
		patron+=1
		
		if patron == P:
			patron = 0
	return pesos

entrada = np.array(
	[
		[0,0],
		[0,1],
		[1,0],
		[1,1]
	]
)

salida = np.array([0,1,1,1])

M = 2
factorEntre = 0.5
maxIT = 200
P = 4

pesos = entrenamientoIndividualizado(entrada, M, factorEntre, maxIT, P)

errorMax = float('inf')
mejoresPesos = np.array([])

for k in range(0,100):
	error = 0
	for i in range(0, entrada.shape[0]):
		
		entradaI = entrada[i]
		h,r,z = redNeuronal(entradaI, pesos)
		
		error += math.pow(r - salida[i],2)
		
	error/=2
	
	if error < errorMax:
		errorMax = error
		mejoresPesos = pesos
	
print errorMax
