import math
def bucketSort(A,n):
    B = []
    for i in range(0,n):
        B.append([])

    for ai in A:
        B[math.floor(n*ai)].append(ai)

    #Ordenamos
    for ai in B:
        for j in range(1,len(ai)):
            key = ai[j]   
            k = j-1

            while k>=0 and key  <= ai[k]:                
                ai[k+1] = ai[k]
                k -= 1
            ai[k+1] = key    
    Sal = []
    for bi in B:
        for elm in bi:
            Sal.append(elm)

    return Sal

print(bucketSort([0.78,0.17,0.39,0.26,0.72,0.94,0.21,0.12,0.23,0.68],10))