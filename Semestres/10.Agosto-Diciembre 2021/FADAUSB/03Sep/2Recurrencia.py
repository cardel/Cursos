"""
Autor: Carlos A Delgado
Fecha: 03 de Septiembre
"""
def recurrencia(n):
    if n==1:
        return 1
    else:
        return 2*recurrencia(n/2)+1

def formula(n):
    return 2*n-1

lista = [2**x for x in range(0,10)]

for elemento in lista:
    print("recurrencia ",recurrencia(elemento)," formula ",formula(elemento))