"""
Autor: Carlos A Delgado
Fecha: 21 de Agosto de 2021
"""
import math
def programa5(n):
	i = 1
	cnt = 1
	while i<=n:
		cnt+=1 #Entrada
		k = i
		cnt+=1
		while k<=n:
			cnt+=1 #Entrada
			k+=2
			cnt+=1
		cnt+=1 #Salida
		k = 1
		cnt+=1
		while k<=i:
			cnt+=1 #Entrada
			k+=1
			cnt+=1
		cnt+=1 #Salida

		i *= 2
		cnt+=1
	cnt+=1 # Salida
	return cnt

def formula5(n):
	c1 = 1 + math.log2(n)+2
	c2 = math.log2(n)+1+n/2+1
	c3 = n/2+math.log2(n)+1
	c4 = math.log2(2*n-2)+2*(2*n-2)
	c5 = math.log2(2*n-2)+2*n-2-1
	c6 = math.log2(n)+1
	return c1+c2+c3+c4+c5+c6

print(programa5(2**10))
print(formula5(2**10))
