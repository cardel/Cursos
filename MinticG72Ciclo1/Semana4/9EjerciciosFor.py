"""
Carlos A Delgado
8 de Junio de 2022
Ejercicios ciclos for

1) Diseñar un programa que imprima los números
de pares desde 1 hasta 100

2 4 6 .. 
print(...,end=" ")

2) Diseñar un programa que imprima los números
que son multiplos de 3 o 5 desde 1 hasta 100

3 5 9 10 12 15 ...
"""
def pares():
    for i in range(1,101):
        if i%2==0:
            print(i,end=" ")
    print() #Salto de linea|
    for i in range(0,101,2):
        print(i,end=" ")
    

def multi_3_5():
    print() #Salto de línea
    for i in range(1,101):
        if i%3==0 or i%5==0:
            print(i,end=" ")
    
pares()
multi_3_5()