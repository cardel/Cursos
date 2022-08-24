
def Partition(A,p,r):
    """
    A arreglo de números
    p indice válido 0..n-1
    r inicio válido 0..n-1
    p <= r
    """
    x = A[p]
    i = p
    j = r

    while True:
        #i busca uno que sea mayor o que x
        while i<=r and not(A[i]>=x):
            i+=1            
        #j busca uno que sea menor que x
        while j>=0 and not(A[j]<=x):
            j-=1
        
        if i<j:
           A[i],A[j] = A[j],A[i]
           i+=1
           j-=1
        else:  
            return j
    

def QuickSort(A,p,r):
    if p<r:
        q = Partition(A,p,r)
        QuickSort(A,p,q)
        QuickSort(A,q+1,r)
        
