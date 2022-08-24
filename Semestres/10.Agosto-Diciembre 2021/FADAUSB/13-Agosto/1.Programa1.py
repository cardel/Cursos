import numpy as np

def programa1(mat1, mat2):
    i = 1
    cnt = 1
    mat3 = mat1.copy()
    while i <= len(mat1):
        cnt += 1  #Comparación en while (cuando entra)
        j = 1
        cnt += 1
        while j <= len(mat2):
            cnt += 1  #Comparación en while (cuando entra)
            cnt += 1
            #mat3[i][j] = mat1[i][j] + mat2[i][j]
            cnt += 1
            j += 1

        cnt += 1  #Cuenta la salida del while interno
        cnt += 1
        i += 1
    cnt += 1  #Cuenta la salida del while externo

    return cnt


def formula(n):
    return 2 + 4 * n + 3*n**2


mat1 = np.ones((100,100))
mat2 = np.ones((100,100))

print(formula(100))
print(programa1(mat1, mat2))
