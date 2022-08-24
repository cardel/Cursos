def programa3(n):
	i = 1
	cnt = 1
	while i<=n:
		cnt += 1 #Entrada
		k = i
		cnt += 1
		while k<=n:
			cnt +=1 #Entrada al ciclo interno
			k+=1
			cnt +=1

		cnt +=1 # Salida del ciclo interno
		k = 1
		cnt +=1
		while k<=i:
			cnt +=1 #Entrada al ciclo interno 2
			k+=1
			cnt +=1
		cnt +=1 # Salida del ciclo interno 2
		i+=1
		cnt +=1
	cnt+=1 #Salida del ciclo externo

	return cnt

def formula(n):
	cnt1 = 1+n+1+n+((n+1)*(n+2))//2+(n*(n+1))//2-1+n
	cnt2 = ((n+1)*(n+2))//2+(n*(n+1))//2-1+n
	return cnt1+cnt2

print(programa3(1000))
print(formula(1000))
