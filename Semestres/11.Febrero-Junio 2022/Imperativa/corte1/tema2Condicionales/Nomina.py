cedula = int(input("Ingrese la cedula "))
salario_basico = float(input("Ingrese la salario_basico "))
ahno = int(input("Ingrese el año "))


if salario_basico >= 1200000 and ahno > 1990:
    salario_neto = 0.92*salario_basico
else:
    if salario_basico < 550000 or ahno == 1990:
        salario_neto = 0.98*salario_basico
    else:
        salario_neto = 0.95*salario_basico

print(f"El salario del empleado {cedula} es {salario_neto}")