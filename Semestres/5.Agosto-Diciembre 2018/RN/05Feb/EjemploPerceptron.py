# encoding: utf-8
# Autor: Carlos Andres Delgado
# Algoritmo Perceptron

import numpy as np
import matplotlib.pyplot as plt
import math
import random as rnd

#Función signo
def signo(x):
        if(x>0):
                result = 1
        elif (x<0):
                result = -1
        else:
                result = 0
                                
        return result
        
        
#Neurona
def neurona(entrada, pesos, theta):
	entradaNeta = np.dot(pesos,np.transpose(entrada))+theta
	salida = signo(entradaNeta)
	return salida

def calcularError(entradas, salidasDeseadas, pesos, tetha):
	#Obtenemos filas y columnas
	filas = entradas.shape[0]
	columnas = entradas.shape[1]
	error = 0
	
	for i in range(0,filas):
		salida = neurona(entradas[i],pesos,theta)
		error = error + math.pow(salidasDeseadas[i]-salida,2)/2

	return error

def algoritmoPerceptron(entradas, salidasDeseadas, tasaAprendizaje):
	
	#Generar pesos aleatorios entre -1 y 1
	pesos = 2*np.random.rand(3)-1
	
	theta = 2*rnd.random()-1  #(B - A)+A  B = 1  A = -1
	
	#Obtenemos filas y columnas
	filas = entradas.shape[0]
	columnas = entradas.shape[1]	
	
	#error
	error = np.zeros(filas)
	
	for i in range(0,filas):
		
		#Calculamos error
		er = calcularError(entradas, salidasDeseadas, pesos, theta)
		error  = np.append(er,error)
	
		
		salidaObtenida =  neurona(entradas[i], pesos, theta)
		salidaDeseadaActual = salidasDeseadas[i]
		
		#Error
		diferencia = salidaDeseadaActual - salidaObtenida
		
		#Regla perceptrón
		# wi = wi + factorAprendizaje*diferencia*entrada[i]
		
		for j in range(0, columnas):
			pesos[j] = pesos[j]+tasaAprendizaje*diferencia*entradas[i][j]
		
		theta = theta+tasaAprendizaje*diferencia
		
	return pesos, error
	
entradas = np.array([[-1,-1,-1],[-1,-1,1],[1,1,-1],[-1,1,1],[1,-1,-1],[1,-1,1],[1,1,-1],[1,1,1]])

salidasDeseadas = np.array([-1,-1,-1,-1,-1,-1,-1,1])

tasaAprendizaje = 0.5

theta = -1

pesosCalculado, error = algoritmoPerceptron(entradas, salidasDeseadas, tasaAprendizaje)

print(pesosCalculado)

figura = plt.figure()
plt.title(u'Error de entrenamiento perceptrón')
plt.xlabel('Iteraciones')
plt.ylabel(u'Error cuadrático medio')
plt.plot(range(1,error.shape[0]+1), error,'bo-')
plt.grid(True)
plt.xticks(range(1,error.shape[0]+1))
plt.show()
