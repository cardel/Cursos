import numpy as np

def countingSort(A):
    n = A.shape[0]
    k = np.max(A)
    B=np.zeros(n,dtype=np.int64)
    C=np.zeros(k,dtype=np.int64)

    #Llenamos c
    for i in range(0,n):
        C[A[i]-1] += 1

    #Ajustamos c
    for i in range(1,k):
        C[i] = C[i]+C[i-1]

    for i in range(0,n):
        B[C[A[i]-1]-1] = A[i]
        C[A[i]-1]-=1

    return B

print(countingSort(np.array([3,6,4,1,3,4,1,4])))

print(countingSort(np.random.randint(1,200,100)))

print(countingSort(np.random.randint(1,100,10)))