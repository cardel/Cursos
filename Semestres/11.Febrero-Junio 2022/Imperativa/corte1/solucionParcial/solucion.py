"""
Carlos A Delgado
Solución primer parcial
06 de Mayo de 2020
"""

#Primer punto
def calcular_salario(tipo,horas,tiempo_trabajado):
    if horas >= 192:
        valor_hora = 0 #Valor de la horas
        salario_base = 0 # Valor salario base

        if tipo=="Ejecutivo":
            valor_hora = 3000000/192
            salario_base = 3000000
        elif tipo=="Administrativo":
            valor_hora = 2000000/192
            salario_base = 2000000
        else:
            valor_hora = 1500000/192
            salario_base = 1500000

        extras = horas  - 192

        total_extras = extras*valor_hora*1.2

        if tiempo_trabajado > 5:
            return 1.2*(salario_base+total_extras)
        else:
            return salario_base+total_extras
    else:
        return "El número de horas debe ser mayor o igual a 192"

print(calcular_salario("Administrativo",199,8))

#Punto 2
def inventario_panadera(n):
    acc_postres = 0 
    acc_panes = 0 
    acc_bebidas = 0
    for i in range(n):
        tipo = input("Ingrese el tipo de producto ")
        valor = float(input("Ingrese el valor del producto "))

        if tipo=="Postres":
            acc_postres+=valor
        elif tipo=="Panes":
            acc_panes+=valor
        else:
            acc_bebidas+=valor
        
    return f"Los postres tienen un valor de {acc_postres}, los panes un valor de {acc_panes} y las bebidas un valor de {acc_bebidas}. El total del inventario es: {acc_bebidas+acc_panes+acc_postres}"

n = int(input("Ingrese el número de productos "))
print(inventario_panadera(n))

#Punto 3
def consumo_kw(consumo):
    if consumo>=0 and consumo<=300:
        return consumo*50
    elif consumo>300 and consumo<=500:
        return 300*50+(consumo-300)*100
    elif consumo>500 and consumo<1000:
        return 300*50+200*100+(consumo-500)*150
    elif consumo>=1000:
        return 300*50+200*100+500*150+(consumo-1000)*200

print(consumo_kw(2500))
print(consumo_kw(380))
print(consumo_kw(610))
print(consumo_kw(180))
