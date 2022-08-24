# encoding: utf-8
# Autor Carlos Delgado.

import numpy as np
import math
from sklearn.neural_network import MLPClassifier


datos = np.array(
[
	[0,0,0,0],
	[0,0,1,1],
	[0,1,0,1],
	[0,1,1,0],
	[1,0,0,1],
	[1,0,1,0],
	[1,1,0,0],
	[1,1,1,1]
])



def funcionActivacion(x):
	return 1/(1+math.exp(-x))

def derivadaFuncionActivacion(x):
	return funcionActivacion(x)*(1-funcionActivacion(x))

def redNeuronal(entradas,pesosCapa1, umbralCO, pesosCapa2, umbralCS):
	entradaNetaC1 = np.dot(pesosCapa1,entradas)+(1)*umbralCO
	
	#Vectorizar una función
	#https://docs.scipy.org/doc/numpy/reference/generated/numpy.vectorize.html
	f = np.vectorize(funcionActivacion)
	
	#Salida capa 1
	salidaCO = f(entradaNetaC1)
	
	entradaNetaC2 = np.dot(pesosCapa2,salidaCO)+(1)*umbralCS
	
	salidaCS = f(entradaNetaC2)
	
	return salidaCS,salidaCO,entradaNetaC1,entradaNetaC2

def calcularErrorCuadraticoMedio(entradas, salidasDeseadas, pesosCO, umbralCO,pesosCS,umbralCS):
	
	numeroDatos = entradas.shape[0]
	errorCM = 0
	for i in range(0, numeroDatos):
		salidaObtenida,salidaCO,entradaCO, entradaCS = redNeuronal(entradas[i,:], pesosCO, umbralCO,pesosCS,umbralCS)
		
		errorCM = errorCM + math.pow(salidasDeseadas[i]-salidaObtenida,2)/2

	return errorCM

def backPropagation(datos, factorEntrenamiento, maxIteraciones):
	
	df = np.vectorize(derivadaFuncionActivacion)
	
	#1. Inicializar los pesos aleatoriamente entre -1 y 1
	pesosCO = 2*np.random.rand(2,3)-1
	umbralCO = 2*np.random.rand(2)-1
	
	pesosCS = 2*np.random.rand(2)-1
	umbralCS = (2*np.random.rand(1)-1)[0]
	
	entradas = datos[:,0:3]
	salidasEsperadas = datos[:,3]
	
	numeroDatos = entradas.shape[0]
	
	#Calcular el error cuadrático medio
	errorC = 0
	it = 0
	#Regla de actualización de los pesos (para neuronal capa oculta)
	while it < maxIteraciones:
		it = it + 1
		for i in range(0,numeroDatos):
			salidaObtenida,salidaCO,entradaCO, entradaCS = redNeuronal(entradas[i,:], pesosCO, umbralCO,pesosCS,umbralCS)
			
			errorCM = calcularErrorCuadraticoMedio(entradas, salidasEsperadas, pesosCO, umbralCO,pesosCS,umbralCS)
			
			print errorCM
			
			diferencia = salidasEsperadas[i]-salidaObtenida
			
			#Actualizo los pesos de salida
			errorCS = diferencia*df(entradaCS)
			pesosCS[0] = pesosCS[0]+factorEntrenamiento*errorCS*salidaCO[0]
			pesosCS[1] = pesosCS[1]+factorEntrenamiento*errorCS*salidaCO[1]
			umbralCS = umbralCS + factorEntrenamiento*errorCS*(1)
			umbralCS = umbralCS + factorEntrenamiento*errorCS*(1)
			
			#Actualizo los pesos de la capa oculta
			
			errorCO = np.dot(pesosCS,errorCS)*df(entradaCO)
			
			pesosCO[0][0] = pesosCO[0][0] + factorEntrenamiento*errorCO[0]*entradas[i,0]
			pesosCO[0][1] = pesosCO[0][1] + factorEntrenamiento*errorCO[0]*entradas[i,1] 
			pesosCO[0][2] = pesosCO[0][2] + factorEntrenamiento*errorCO[0]*entradas[i,2]
			
			pesosCO[1][0] = pesosCO[1][0] + factorEntrenamiento*errorCO[1]*entradas[i,0]
			pesosCO[1][1] = pesosCO[1][1] + factorEntrenamiento*errorCO[1]*entradas[i,1]
			pesosCO[1][2] = pesosCO[1][2] + factorEntrenamiento*errorCO[1]*entradas[i,2]
			
			umbralCO[0] = umbralCO[0]+ factorEntrenamiento*errorCO[0]*(1)
			umbralCO[1] = umbralCO[1]+ factorEntrenamiento*errorCO[1]*(1)
	return pesosCO, umbralCO, pesosCS, umbralCS

backPropagation(datos, 0.2,200)

clf = MLPClassifier(activation='logistic', solver='sgd', tol=1e-4, hidden_layer_sizes=(3,),verbose=False, max_iter=10000)
clf.fit(datos[:,0:3],datos[:,3])
print("Función de perdida", clf.loss_)
