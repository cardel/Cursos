import numpy
import random

#Vamos a simular un juego de poker



def experimento(n):
	contador = 0
	for i in range(0,n):

		mano = numpy.random.permutation([1,2,3,4,5,6,7,8,9,10,11,12,13,1,2,3,4,5,6,7,8,9,10,11,12,13,1,2,3,4,5,6,7,8,9,10,11,12,13,1,2,3,4,5,6,7,8,9,10,11,12,13])

		manito =numpy.sort(mano[1:6])

		if (manito[0] == manito[1]-1) and (manito[1] == manito[2]-1) and  (manito[2] == manito[3]-1) and  (manito[3] == manito[4]-1):
			contador = contador + 1   
	
	return contador/float(n)
	
	
print(experimento(100))
print(experimento(1000))
print(experimento(10000))
print(experimento(100000))
print(experimento(1000000))
