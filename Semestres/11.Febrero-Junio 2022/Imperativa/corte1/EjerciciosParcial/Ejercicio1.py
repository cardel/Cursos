"""
Carlos A Delgado S.
22-Abril-2022
Ejercicio calculo de salario
"""

def calcular_salario(valor_base,bonificacion):
    ibc = valor_base*0.4
    smlv = 1000000
    if ibc < 1000000:
        ibc = 1000000
    
    #Aportes de impuestos
    salud = ibc*0.125
    pension = ibc*0.16
    arl = ibc*0.005
    solidaridad = 0

    if valor_base >= 3*smlv:
        solidaridad = 0.1*ibc

    total_impuestos = 0.4*(salud+pension+solidaridad+arl)

    #Retefuente
    total_salario = valor_base+bonificacion
    retefuente = 0

    if total_salario >= 4*smlv and total_salario <= 8*smlv:
        retefuente = 0.089*total_salario
    elif total_salario > 8*smlv and total_salario < 12*smlv:
        retefuente = 0.125*total_salario
    elif total_salario >= 12*smlv:
        retefuente = 0.18*total_salario
    else:
        retefuente = 0

    total_descuentos = total_impuestos+retefuente

    valor_a_pagar = valor_base+bonificacion-total_descuentos
    return valor_a_pagar

num_empleados = int(input("Ingrese el número de empleados "))

for i in range(0,num_empleados):

    valor_base = float(input(f"ingrese el valor base del empleado {i+1} "))
    valor_bonificacion = float(input(f"ingrese el valor de la bonificaciones del empleado {i+1} "))

    print(calcular_salario(valor_base,valor_bonificacion))