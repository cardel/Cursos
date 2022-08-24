#encoding: utf8
#Autor: Carlos Delgado
#Ejemplo de una red neuronal de base radiial.
import numpy as np
import math
"""
Implementación del algoritmo kmeans
"""
def kmeans(entradas, k, max_it=10000):
	"""
	entradas: Caracteristicas
	k: número de centros
	Centro aleatorios entre MIN Y MAX
	"""
	min = np.min(entradas)
	max = np.max(entradas)
	centros = (max-min)*np.random.rand(k,entradas.shape[1])+min
	
	it = 0
	while True:
	
		it += 1
		"""
		A que cluster pertenece cada entrada
		cluster 0
		cluster 1
		...
		cluster k-1
		"""
		clasificar = np.zeros(entradas.shape[0])
		distancias = np.zeros([entradas.shape[0],k])
		for i in range(0, entradas.shape[0]):
			#Comparamos contra cada centro
			for j in range(0,k):
				centroA = centros[j]
				entradaA = entradas[i]
				
				distancias[i,j] = np.sum(np.abs(centroA-entradaA))
			
			clasificar[i]= np.argmin(distancias[i])
			
		"""
		Volver a calcular los centros
		"""
		nuevosCentros = np.zeros([k,entradas.shape[1]])
		numeroDeElementos = np.zeros(k)
		for i in range(0, entradas.shape[0]):
			clusterActual = clasificar[i]
			nuevosCentros[int(clusterActual)] += entradas[i]
			
		for i in range(0, k):
			if numeroDeElementos[i] != 0:
				nuevosCentros[i]/=numeroDeElementos[k]
			else:
				nuevosCentros[i] = centros[i]
		
		if np.array_equal(centros, nuevosCentros) or it == max_it:
			break
			
	return centros
	
"""
Implementamos la red neuronal
"""
def funcionBaseRadial(r):
	return math.exp(-math.pow(r,2)/2)
	

def redNeuronal(entrada, parametroD, centrosCO, pesosCS):
	
	"""
	Capa oculta
	"""
	numeroCentros = centrosCO.shape[0]
	salidaCapaOculta = np.zeros(numeroCentros)
	entradaCapaOculta = np.zeros(numeroCentros)
	
	for i in range(0, numeroCentros):
		entradaCapaOculta[i] = np.power(np.sum(np.power(entrada-centrosCO[i],2))/parametroD[i],0.5)
		
		salidaCapaOculta[i] = funcionBaseRadial(entradaCapaOculta[i])
		
	"""
	Capa de salida
	"""
	salida = np.dot(pesosCS, salidaCapaOculta)
	
	return salida,entradaCapaOculta

"""
Entrenamiento hibrido o semisupervisado
"""

def determinarParametroD(centros):
	
	parametroD = np.zeros(centros.shape[0])
	
	for i in range(0, centros.shape[0]):
		
		for j in range(0, centros.shape[0]):
			if i != j:
				distancia = np.sum(np.abs(centros[i] - centros[j]))
				parametroD[i] = distancia
			
			parametroD[i]/=(centros.shape[0]-1)

	return parametroD

def calcularEMC(pesos, centros, parametroD, entradas, salidas):
	error = 0
	for i in range(0, entradas.shape[0]):
		entradaI = entradas[i]
		
		salidaO, entCO = redNeuronal(entradaI,parametroD, centros, pesos)
		
		salidaI = salidas[i]
		
		diferencia = np.sum(np.power(salidaI - salidaO,2))
	
		error += diferencia
	
	return error/2

def entrenamiento(entradas, salidas, k, factorEntrenamiento, errorEMC = 0.05, max_it=10000):
	"""Fase no supervisada"""
	centros = kmeans(entradas,k)
	parametroD = determinarParametroD(centros)
	
	"""Fase supervisada"""
	numeroSalidas = salidas.shape[1]
	pesos = 2*np.random.rand(numeroSalidas,k)-1
	error = 0
	it = 0
	while True:
		it += 1
		
		for i in range(0, entradas.shape[0]):
			entradaI = entradas[i]
			salidaI = salidas[i]
			
			salidaO, entCO = redNeuronal(entradaI,parametroD, centros, pesos)
			
			"""
			Entero
			"""
			
			diferencia = np.sum(salidaI - salidaO)
			
			for j in range(0, pesos.shape[0]):
				for k in range(0, pesos.shape[1]):
					pesos[j,k] = pesos[j,k]+factorEntrenamiento*diferencia*funcionBaseRadial(entCO[j])
			
			for j in range(0, centros.shape[0]):	
					centros[j] = centros[j]+factorEntrenamiento*diferencia
					
		"""
		Calculamos ECM
		"""
		error = calcularEMC(pesos, centros, parametroD, entradas, salidas)
		
		if error <= errorEMC or it == max_it:
			break
	
	return centros, pesos, error, parametroD
	
entradas = np.array([
	[0,0,0],
	[0,0,1],
	[0,1,0],
	[0,1,1],
	[1,0,0],
	[1,0,1],
	[1,1,0],
	[1,1,1],
	]
)


salidas = np.array([[0],[1],[1],[0],[1],[0],[0],[1]])
k = 5
factorEntrenamiento = 0.5

centros, pesos, error,parametroD = entrenamiento(entradas, salidas, k,factorEntrenamiento)

print centros
print pesos
print error


for i in range(0, entradas.shape[0]):
	entradaI = entradas[i]
	
	salidaO, entCO = redNeuronal(entradaI,parametroD, centros, pesos)
	
	salidaI = salidas[i]
	
	print("Salida deseada",salidaI)
	print("Salida obtenida",salidaO)
	
	
	
