"""
Carlos A Delgado
01-Junio-2022
Ejemplo de diseño de condicionales
"""
def verificar_numero(n):
    """
    n es un entero
    La función me retorna un string indicando si el número es positivo o no, si es positivo entonces indico si es par o impar
    """
    if n>=0 and n%2==0:
        return str(n)+" es un número positivo par"
    elif n>=0 and  n%2!=0: #n>=0 and not(n%2==0)
        return str(n)+" es un número positivo impar"
    else:
        return str(n)+" es un número negativo"

print(verificar_numero(10))
print(verificar_numero(501))
print(verificar_numero(-20))

