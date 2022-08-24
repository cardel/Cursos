"""
Autor: Carlos A Delgado
Fecha:28 de Abril de 2022
Descripción: Ejercicio de astericos
"""

def patron_1(n):
    for i in range(1,n+1):
        for j in range(1,i+1):
            print("*",end=" ")
        print()
    
    for i in range(n-1,0,-1):
        for j in range(1,i+1):
            print("*",end=" ")
        print()

def patron_2(n):
    for i in range(n,0,-1):
        for j in range(1,i+1):
            print("*",end=" ")
        print()
    for i in range(2,n+1):
        for j in range(1,i+1):
            print("*",end=" ")
        print()

def patron_3(n):
    print((n)*2*" "+"*")
    for i in range(1,n+1):
        print(" "*2*(n-i),end=" ")
        for j in range(1,i+1):
            print("* *",end=" ")
        #print(" "*2*(n-i),end=" ")
        print()

n = int(input("Ingrese el tamaño "))
patron_1(n)
print("========================")
patron_2(n)
print("========================")
patron_3(n)