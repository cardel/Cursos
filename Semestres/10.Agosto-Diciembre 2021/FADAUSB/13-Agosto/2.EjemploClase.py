'''
Autor: Carlos A Delgado
Fecha: 13 de Agosto de 2021
Ejemplo de clase
'''

def programa_pro(n):
	cnt = 0
	i = 3
	cnt+=1
	j = 4
	cnt+=1
	while i<n:
		cnt+=1 #Cuento i<n cuando entra
		j = i
		cnt+=1
		while j <= 2*n:
			cnt+=1 #Cuento j <= 2*n cuando entra
			j+=1
			cnt+=1
		cnt+=1 #Cuento j <= 2*n cuando sale
		i+=1
		cnt+=1
	cnt+=1 #Cuando i < n cuando sale
	return cnt

def formula(n):
	while_interno = (2*n+2)*(n-3)-(((n-1)*(n))//2-3)
	while_interno_entra = (2*n+1)*(n-3)-(((n-1)*(n))//2-3)
	return 1+1+n-2+n-3+n-3+while_interno+while_interno_entra

print(programa_pro(100))
print(formula(100))
