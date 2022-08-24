def factorial(n):
    if n==1:
        return 1
    else:
        return n*factorial(n-1)

def listaFactoriales(n):
    salida = []
    for i in range(1,n+1):
        salida.append(factorial(i))

    return salida

def listaFactorialesR(n,l):
    if n==1:
        l.insert(0,factorial(n))
        return l
    else:
        l.insert(0,factorial(n))
        return listaFactorialesR(n-1,l)
print(listaFactoriales(5))
print(listaFactorialesR(5,[]))