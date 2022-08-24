"""
Autor: Carlos A Delgado
Fecha: 01 de Abril de 2022
Descripción: Ejercicio día del IVA
"""

def calcular_total(precio,tipo_producto):
    if precio>=1500000:
        if tipo_producto=="alimento":
            iva = 0.05*precio
        elif tipo_producto == "tecnologia":
            iva = 0.08*precio
        elif tipo_producto == "ropa":
            iva = 0.19*precio
        elif tipo_producto == "medicinas":
            iva = 0.12*precio
        else:
            print("No existe el producto")

        if iva > 200000:
            iva = iva - 20000 - iva*0.02
    else:
        iva = 0

    return iva+precio

precio = int(input("Ingrese el precio\n"))
tipo_producto = input("Ingrese el tipo de producto\n")

precio_total = calcular_total(precio,tipo_producto)
print(precio_total)