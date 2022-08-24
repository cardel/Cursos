import math

def RR(n):
    if n==1:
        return 10
    else:
        return 5*RR(n/2)+3*math.pow(n,2)


def formula(n):
    return 22*math.pow(n,math.log2(5))-12*math.pow(n,2)

x = [2**x for x in range(0,10)]


for xi in x:
    print("x ",xi," RR ",RR(xi)," F ",formula(xi))

