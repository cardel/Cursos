import math
def recurrencia(n):
    if n==1:
        return 4
    elif n==2:
        return 6
    else:
        return 4*recurrencia(n/2)-4*recurrencia(n/4)+n+5


def formula(n):
    return (-1+math.log2(n))*n+5+(1/2)*(math.log2(n)**2)*n


listaPot2 = [2**x for x in range(0,10)]

for n in listaPot2:
    print(recurrencia(n),formula(n))