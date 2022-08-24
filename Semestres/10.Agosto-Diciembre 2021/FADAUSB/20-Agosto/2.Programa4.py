def programa4(n):
	i = 1
	cnt = 1
	while i<=n:
		cnt +=1 #entrada c0
		k = i
		cnt +=1
		while k<=n:
			cnt +=1 #entrada c1
			k = k+2
			cnt +=1
		cnt +=1 #salida c1
		k = 1
		cnt +=1
		while k<=i:
			cnt +=1 #entrada c2
			k = k+1
			cnt +=1
		cnt +=1 #salida c2
		i = i+2
		cnt +=1
	cnt +=1 #salida c0
	return cnt

def formula(n):
	if n%2==0:
		c1 = 1 + n/2+1+(n/2)
		c2 = (n/2)**2+n-(n/2)*(n/2+1)/2
		c3 = (n/2)**2+n/2-(n/2)*(n/2+1)/2
		c4 = n/2+(n/2)*(n/2+1)+(n/2)**2+(n/2)
		return c1+c2+c3+c4
	else:
		c1 = 1 + (n+1)/2+1+((n+1)/2)
		c2 = ((n+1)/2)**2+n+1-((n+1)/2)*((n+1)/2+1)/2
		c3 = ((n+1)/2)**2+(n+1)/2-((n+1)/2)*((n+1)/2+1)/2
		c4 = (n+1)/2+((n+1)/2)*((n+1)/2+1)+((n+1)/2)**2+((n+1)/2)
		return c1+c2+c3+c4

print(programa4(1000))
print(formula(1000))
print(programa4(1001))
print(formula(1001))
