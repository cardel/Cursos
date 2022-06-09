"""
Carlos A Delgado
08 de Junio de 2022
Ejercicio de while en clase

1) Diseñar un programa que imprima los números
de pares desde 1 hasta 100

2 4 6 .. 
print(...,end=" ")

2) Diseñar un programa que imprima los números
que son multiplos de 3 o 5 desde 1 hasta 100

3 5 9 10 12 15 ...
"""
def pares():
    i = 1
    while i<=100:
        if i%2==0:
            print(i,end=" ")
        i=i+1
    
    print() #Salto de linea
    i = 2
    while i<=100:
        print(i,end=" ")
        i=i+2

    #Forma de Harold David
    i = 0
    while i <= 100:
        i = i + 2
        print(" el valor de i es: " + str(i),end=" ")

    #Forma de Reynaldo
    i = 0
    while i <= 98:
        if i % 2 == 0:
            i = i+2
            print(i)
        else:
            i = i+2     

def multi_3_5():
    i = 1
    while i<=100:
        if i%3==0 or i%5==0:
            print(i,end=" ")
        i+=1

pares()
print() #Salto de linea
multi_3_5()