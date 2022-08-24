import math
def heapify(a,i,n):
	
	izq = -1
	if(2*i <= n):
		izq = 2*i
	
	der = -1
	if 2*i+1 <= n:
		der = 2*i+1
	
	if(izq == -1 and der == -1):
		return a
	else:
		if(der == -1):
			if a[i-1] < a[2*i-1]:
				aux = a[i-1]
				a[i-1]=a[2*i-1]
				a[2*i-1]= aux
				return heapify(a,izq,n)
			else:
				return a
		else:
			if a[2*i-1]>a[2*i+1-1]:
				if a[2*i-1]>a[i-1]:					
					aux = a[i-1]
					a[i-1]=a[2*i-1]
					a[2*i-1]= aux
					return heapify(a,izq,n)
				else:
					return a
			else:
				if a[2*i-1+1]>a[i-1]:					
					aux = a[i-1]
					a[i-1]=a[2*i-1+1]
					a[2*i-1+1]= aux
					return heapify(a,der,n)
				else:
					return a


def buildHeap(a):
	n = len(a)
	mitad = math.floor(n)
	
	for i in range(mitad,0,-1):
		a = heapify(a,i,n)
	
	return a
	
def heapSort(a):
	n = len(a)
	c = buildHeap(a)
	for i in range(1,n+1):
		aux = c[0]
		c[0] = c[n-1]
		c[n-1]=aux
		n-=1
		c = heapify(a,1,n)
	
	return c
	
a = [15,2,3,4,5,9,12,6,10,50,40,30,1,1]
b=heapify(a,1,len(a))
print("Aplicando heapify(a,1)",b)

c=buildHeap(a)
print("Monticulo",c)

f = heapSort(a)
print("Ordenado", f)



