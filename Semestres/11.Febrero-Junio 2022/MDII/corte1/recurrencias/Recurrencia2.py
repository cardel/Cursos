import numpy as np 

def recurrencia2(n):
    if n==0:
        return 20
    elif n==1:
        return 10
    else:
        return -recurrencia2(n-1)+42*recurrencia2(n-2)


def formula(n):
    return (150/13)*6**n+(110/13)*(-7)**n

for n in range(0,20):
    print(recurrencia2(n),formula(n))