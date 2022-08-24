
def busqueda_binaria(A,p,r,x):
    global cnt
    cnt+=1
    if p<r:
        q = (p+r)//2
        a = A[q]
        if a == x:
            return True
        elif a > x: #Debo buscar a la izquierda
            return busqueda_binaria(A,p,q,x)
        else: #Busque a la derecha
            return busqueda_binaria(A,q+1,r,x)
    else:
        return False

lista = [1,2,3,4,5,6,7,8,10,11,12,13,14,15,16,17,18,19,20]
cnt = 0
print(busqueda_binaria(lista,0,len(lista)-1,14))
print(cnt)
cnt = 0
print(busqueda_binaria(lista,0,len(lista)-1,9))
print(cnt)