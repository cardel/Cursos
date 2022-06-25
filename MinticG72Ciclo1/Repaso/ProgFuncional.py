"""
Carlos A Delgado
24 de Junio de 2022
Recordatorio de programación funcional
"""
from functools import reduce
def operar(f,a,b):
    return f(a,b)

print(operar(lambda x,y:x*y,10,20))

lista = [1,2,3,4,5,6,7,8,9,10]

listaR = []
for elm in lista:
    listaR.append(elm**2)
print(listaR)

listaR2 = list(map(lambda x:x**2,lista))
print(listaR2)

listaF1 = []
for elm in lista:
    if elm % 2 == 0:
        listaF1.append(elm)

print(listaF1)

listaF2 = list(filter(lambda x:x%2==0,lista))
print(listaF2)

sumaR = 0
for elm in lista:
    sumaR = sumaR+elm

print(sumaR)

sumaR2 = reduce(lambda acc,x:acc+x,lista,0)
print(sumaR2)