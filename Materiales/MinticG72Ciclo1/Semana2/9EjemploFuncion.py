
def suma(a,b):
    """
    Esta función recibe dos números y me retorna su suma
    """
    c = a+b
    return c

m = int(input("Ingrese un número "))
n = int(input("Ingrese otro número "))
resultado = suma(n,m)
print("La suma de los dos números es "+str(resultado))
resultado = suma(5,m)
print("La suma de los dos números es "+str(resultado))
