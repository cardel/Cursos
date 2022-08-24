import numpy as np 
from fractions import Fraction as fr

coeff = np.array([1,-4,1,6])
print(np.roots(coeff))

a = np.array([
    [1,1,1],
    [2,3,-1],
    [4,9,1]
])

b = np.array([10,15,20])
const = np.linalg.solve(a,b)
print(const)
print(list(map(lambda x: fr(x).limit_denominator(), np.linalg.solve(a,b))))

def recurrencia(n):
    if n==0:
        return 10
    elif n==1:
        return 15
    elif n==2:
        return 20
    else:
        return 4*recurrencia(n-1)-recurrencia(n-2)-6*recurrencia(n-3)

def formula(n):
    return const[0]*2**n+const[1]*3**n+const[2]*(-1)**n

for n in range(0,30):
    print(recurrencia(n),formula(n))