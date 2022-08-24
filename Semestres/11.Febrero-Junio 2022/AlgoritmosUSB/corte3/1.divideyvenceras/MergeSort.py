import math

def merge(p,q,r,A):
    left = A[p:q+1] #q+1 es para que incluya a q
    right = A[q+1:r+1] #r+1 para que incluya a r
    left.append(float("inf"))
    right.append(float("inf"))
    i = 0
    j = 0
    for k in range(p,r+1):
        if left[i]<right[j]:
            A[k] = left[i]
            i+=1
        else:
            A[k] = right[j]
            j+=1



def mergeSort(p,r,A):
    #print(p,r)
    if p<r:
        q = math.floor((p+r)/2)
        mergeSort(p,q,A)
        mergeSort(q+1,r,A)
        #print(f"merge({p},{q},{r})")
        merge(p,q,r,A)

lista =[2,10,12,20,30,-2,13,7]
mergeSort(0,7,lista)
print(lista)

lista2 =[2,10,12,20,30,-2,13,7,4]
mergeSort(0,8,lista2)
print(lista2)