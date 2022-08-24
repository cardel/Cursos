import numpy as np
import fractions as frac
a = np.array([
    [0,1,1],[3,3,1],[18,9,1]
])

b = np.array([4,1,-80])

print(list(map(lambda x: frac.Fraction(x).limit_denominator(), np.linalg.solve(a,b))))

def recurrencia(n):
    if n==0:
        return 4
    if n==1:
        return 12
    if n==2:
        return 32
    else:
        return 7*recurrencia(n-1)-15*recurrencia(n-2)+9*recurrencia(n-3)+4*3**n+8

def formula(n):
    return ((-12)*n+(33/2))*3**n-(25/2)+(3)*(n**2)*3**n+2*n

for n in range(0,20):
    print(recurrencia(n),formula(n))