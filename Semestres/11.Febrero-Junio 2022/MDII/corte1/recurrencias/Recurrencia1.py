import numpy as np

a = np.array([[1,1],[7,2]])
b = np.array([10,15])

print(np.linalg.solve(a, b))

def recurrencia1(n):
    if n==0:
        return 10
    elif n==1:
        return 15
    else:
        return 9*recurrencia1(n-1)-14*recurrencia1(n-2)

def formula(n):
    return -1*7**n+11*2**n

for n in range(0,20):
    print(recurrencia1(n),formula(n))