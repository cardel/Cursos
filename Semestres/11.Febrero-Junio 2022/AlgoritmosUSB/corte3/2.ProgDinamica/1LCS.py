"""
Carlos A Delgado
IMplementación algoritmo LCS (longest common subsequence)
"""
import numpy as np


def LCS(x, y):
    xi = " "+x
    yj = " "+y
    c = np.zeros((len(xi), len(yj)))

    for i in range(len(xi)):
        for j in range(len(yj)):
            if xi[i] == " " or yj[j] == " ":
                c[i, j] = 0  # Caso trivial
            elif xi[i] == yj[j]:
                c[i, j] = c[i-1, j-1]+1  # Caso que son iguales
            else:
                # caso cuando no son iguales
                c[i, j] = max(c[i-1, j], c[i, j-1])

    # Esquina inferior
    posi = len(xi)-1
    posj = len(yj)-1
    sol = ""
    while True:
        if c[posi, posj] == 0:
            break
        elif xi[posi] == yj[posj]:  # cuando son iguales
            sol = xi[posi]+sol
            posi -= 1
            posj -= 1
        elif c[posi-1, posj] > c[posi, posj-1]:
            posi -= 1
        else:
            posj -= 1
    return c, sol


print(LCS("AFCEA", "CFEHA"))
