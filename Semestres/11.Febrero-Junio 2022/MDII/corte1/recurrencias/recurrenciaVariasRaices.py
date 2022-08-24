import numpy as np

print(np.roots([1,-5,8,-4]))

a = np.array(
    [[1,0,1],[2,2,1],[4,8,1]]
)
b= np.array([10,15,20])

print(np.linalg.solve(a,b))

def recurrencia(n):
    if n==0:
        return 10
    elif n==1:
        return 15
    elif n==2:
        return 20
    else:
        return 5*recurrencia(n-1)-8*recurrencia(n-2)+4*recurrencia(n-3)

def formula(n):
    return (10-2.5*n)*2**n

for n in range(0,20):
    print(recurrencia(n),formula(n))