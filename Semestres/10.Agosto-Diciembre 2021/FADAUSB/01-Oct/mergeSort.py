def merge(A,p,q,r):
    izquierda = A[p:q+1] #Saco elementos desde A[p] hasta A[q]
    derecha = A[q+1:r+1] #Saco elemento desde A[q+1] hasta A[r]

    #Se agrega un elemento más para evitar desborde
    izquierda.append(float("inf"))
    derecha.append(float("inf"))


    i = 0 #Izquierda
    j = 0 #Derecha
    k = p
    while k <= r and j < len(derecha) and i < len(izquierda): #Condicion de desborde
        if izquierda[i]>derecha[j]:
            A[k] = derecha[j]
            j+=1
        else:
            A[k] = izquierda[i]
            i+=1
        k+=1

def mergeSort(A,p,r):

    if p<r:
        q = (p+r)//2
        mergeSort(A,p,q) #División por la izquierda
        mergeSort(A,q+1,r) #División por la derecha        
        merge(A,p,q,r) #Combinar

listaA = [12,3,2,1,5,3,0,10,4,5,6,-1]
mergeSort(listaA,0,11)
print(listaA)

listaB = [12,23,2,1,0]
mergeSort(listaB,0,4)
print(listaB)

