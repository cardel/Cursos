"""
Autor: Carlos A Delgado S
Fecha: 29 de Abril de 2022
Descripción: Ejercicio de for anidado
"""

def imprimir(n):
    if n<1:
        print("El valor de n es invalido")
    else:
        for i in range(1,n+1):
            for j in range(1,i+1):
                print(j,end=" ")
            print()

n = int(input("El valor de n\n"))
imprimir(n)