"""
Autor: Carlos A Delgado S
Fecha: 08 de Abril de 2022
Descripción: Ejercicio de la tienda
"""

n = int(input("Ingrese el número de productos a comprar "))

def mensaje():
    print("******************MI TIENDITA*******************")
    print("1. Frutas")
    print("2. Vegetales")
    print("3. Juguetes")
    print("4. Carne")

def calcular_precio_iva(cod,total):
    if cod==1:
        return total*1.05
    elif cod==2:
        return total*1.1
    elif cod==3:
        return total*1.08
    elif cod==4:
        return total*1.19
    else:
        print("Codigo no válido")
        return 0


def comprar_for(n):
    total = 0
    for i in range(0,n):
        mensaje()
        codigo = int(input(f"Ingrese el código del producto {i+1} "))
        precio = float(input(f"Ingrese el precio del producto {i+1} "))
        cantidad = int(input(f"Ingrese el cantidad del producto {i+1} "))

        precio_con_iva = calcular_precio_iva(codigo,precio*cantidad)

        total += precio_con_iva

    return total


def comprar_while(n):
    total = 0
    i = 0
    while i<n:
        mensaje()
        codigo = int(input(f"Ingrese el código del producto {i+1} "))
        precio = float(input(f"Ingrese el precio del producto {i+1} "))
        cantidad = int(input(f"Ingrese el cantidad del producto {i+ 1} "))

        precio_con_iva = calcular_precio_iva(codigo,precio*cantidad)

        total += precio_con_iva
        i+=1

    return total

print("*****Ciclo for********")
print(comprar_for(n))
print("****************Ciclo while****************")
print(comprar_while(n))