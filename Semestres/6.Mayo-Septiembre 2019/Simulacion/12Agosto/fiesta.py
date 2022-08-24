import numpy
import random
from collections import Counter


probabilidades = numpy.array([])

for iteradorcito in range(0,100):
	contador = 0
	for i in range(0,1000):
		dias = numpy.random.randint(1,365,size=30)
		repetidos = [item for item, count in Counter(dias).iteritems() if count > 1]
		if  not([]  == repetidos):
			contador = contador + 1
	probabilidades = numpy.append(probabilidades, contador/1000.0)
	
print(probabilidades)

promedio = numpy.average(probabilidades)

print("Promedio", promedio)

desviacion = numpy.std(probabilidades)

print("Desviacion S", desviacion)

print("Rango ", promedio-1.96*desviacion, promedio+1.96*desviacion)
