import numpy as np

def maximo_imp1(arreglo):
    cnt = 0
    maxi = float("-inf")
    for i in range(0,arreglo.shape[0]):
        cnt+=1
        if arreglo[i]>maxi:
            maxi = arreglo[i] 

    return maxi,cnt

cntB = 0
def max_imp2aux(arreglo,p,q):
    if p<q:
        r = (q+p)//2

        
        maxi1 = max_imp2aux(arreglo,p,r)
        maxi2 = max_imp2aux(arreglo,r+1,q)

        return maxi1 if maxi1>maxi2 else maxi2
    else:

        return arreglo[p]

def maximo_imp2(arreglo):
    return max_imp2aux(arreglo,0,arreglo.shape[0]-1)


arreglo = np.random.randint(10,100,2000)
print(arreglo)

print(maximo_imp1(arreglo))
print(maximo_imp2(arreglo),cntB)
