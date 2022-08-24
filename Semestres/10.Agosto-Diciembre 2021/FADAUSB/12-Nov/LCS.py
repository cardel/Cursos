import numpy as np
def LCS(X,Y):
    c = np.zeros((len(X)+1,len(Y)+1))
    X = " "+X
    Y = " "+Y

    for i in range(1,c.shape[0]):
        for j in range(1,c.shape[1]):
            if X[i]==Y[j]:
                c[i,j] = c[i-1,j-1]+1
            else:
                c[i,j] = max(c[i-1,j],c[i,j-1])

    #Construcción
    res = ""
    i = len(X)-1
    j = len(Y)-1

    while(True):
        if i==0 or j==0:
            break

        if X[i] == Y[j]:
            res = X[i]+res
            i -= 1
            j -= 1
        else:
            if c[i-1,j]>c[i,j-1]:
                i-=1
            else:
                j-=1


    return c,res

print(LCS("ABCBDAB","BDCABA"))
print(LCS("AFCEA","CFEHA"))