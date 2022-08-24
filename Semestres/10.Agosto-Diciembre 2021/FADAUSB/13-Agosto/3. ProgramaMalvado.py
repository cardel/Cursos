'''
Autor: Carlos A Delgado
Fecha: 13-Agosto-2021
'''

def programa_malvado(n):
	cnt = 0
	i = 1
	cnt += 1
	while i<=3*n:
		cnt+=1 #i válidos
		j = 1
		cnt+=1
		while j < i:
				cnt+=1 #j válidos
				j+=1
				cnt+=1
		cnt+=1 #salida j
		i+=1
		cnt+=1
	cnt+=1 #salida i
	return cnt

def formula(n):
	return 1+3*n+1+3*n+3*n*(3*n+1)-3*n+3*n


print(programa_malvado(1000))
print(formula(1000))
