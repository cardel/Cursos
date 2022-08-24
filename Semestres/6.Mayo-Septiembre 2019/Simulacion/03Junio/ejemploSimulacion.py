#encoding: utf-8
#Autor: Carlos A Delgado S
#Fecha: 03 de Junio de 2019
import numpy as np;

#Esta función implementar el generador lineal congruente
def generadorLinealCongruente(a,c,m,Xn1):

	#Ecuación: Xn = a(Xn-1+ c)mod m
	salida = np.array([Xn1])
	for i in range(0,4*m):
		Xn = (a*Xn1+c) % m
		salida = np.append(salida, Xn)
		Xn1 = Xn
	
	return salida
	
print(generadorLinealCongruente(3,2,10,3))
print(generadorLinealCongruente(5,6,8,4))


#Esta función implementar el generador fibunnacci
def generadorLinealCongruenteFib(m,Xn2,Xn1):

	#Ecuación: Xn = a(Xn-1*Xn-2) mod m
	salidaSuma = np.array([Xn2, Xn1])
	salidaMul = np.array([Xn2, Xn1])
	
	
	#Suma
	Xn1s = Xn1
	Xn2s = Xn2
	
	#Multiplicacion
	Xn1m = Xn1
	Xn2m = Xn2
	
	for i in range(0,2*m):
		
		#Suma
		Xns = (Xn1s+Xn2s) % m
		Xn2s = Xn1s
		Xn1s = Xns
		
		salidaSuma = np.append(salidaSuma, Xns)
		
		#Multiplicacion
		Xnm = (Xn1m*Xn2m) % m
		Xn2m = Xn1m
		Xn1m = Xnm
		
		salidaMul = np.append(salidaMul, Xnm)
	return salidaSuma,salidaMul

print("Suma ",generadorLinealCongruenteFib(10,3,6)[0])
print("Multi ",generadorLinealCongruenteFib(10,3,6)[1])
print("Suma ",generadorLinealCongruenteFib(8,4,8)[0])
print("Multi ",generadorLinealCongruenteFib(8,4,8)[1])



