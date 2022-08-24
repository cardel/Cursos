# encoding: utf-8
import numpy as np
import math 


def redNeuronal(entradas, pesos):
	salida = np.zeros(3)
	entradaNeta = np.dot(pesos,np.transpose(entradas))
	salida=sigmoide(entradaNeta)
	
	return salida

pesos = np.array([0.3,0.6,0.7])


#Funciones de activación

#Funcion sigmoide
def sigmoide(x):
    return 1.0 / (1.0 + math.exp(-x))

entrada = np.array([[1,1,1],[0,1,0],[0,0,0]])

z = np.zeros(3)

for i in range(0,3):
	print(redNeuronal(entrada[i],pesos))
	

