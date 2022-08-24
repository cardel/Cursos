
def comparar(a,b):
    return a if a>b else b

def maximo_divide_venceras(arreglo,p,r):
    global cnt
    cnt+=1
    if p < r:
        q = (p+r)//2
        a = maximo_divide_venceras(arreglo,p,q)
        b = maximo_divide_venceras(arreglo,q+1,r)
        return comparar(a,b)
    else: #p==r
        return arreglo[p]
cnt = 0
lista = [1,4,5,6,7,8,9,10,11,12,0,3,2,10,23,10,-1,50]
print(maximo_divide_venceras(lista,0,len(lista)-1))
print("Algoritmo ",cnt," Costo con doble for ",len(lista)**2)