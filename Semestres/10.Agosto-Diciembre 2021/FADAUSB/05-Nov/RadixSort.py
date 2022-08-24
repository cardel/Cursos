import numpy as np

def radixSort(A):
    maxi = np.max(A)
    digitos = len(str(maxi))
    As = []
    for i in A:
        As.append(str(i))
    
    for d in range(digitos-1,-1,-1):
        for j in range(1,len(As)):
            key = As[j]   
            k = j-1

            while k>=0 and key[d]  <= As[k][i]:                
                As[k+1] = As[k]
                k -= 1
            As[k+1] = key

    return np.array(list(map(lambda x:int(x),As)))


print(radixSort(np.array([329,457,657,839,436,720,355])))