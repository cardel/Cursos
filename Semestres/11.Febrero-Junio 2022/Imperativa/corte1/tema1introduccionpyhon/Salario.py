

salario_neto=int(input("Ingrese el salario "))

valor_contributivo = 0.4*salario_neto

salud = valor_contributivo*0.125
pension = valor_contributivo*0.16

total_pago = salario_neto-salud-pension

print(total_pago)
print(f"El empleado tiene como salario neto {salario_neto}, se le descuenta {salud} por salud y {pension} por pensión recibiendo un salario de {total_pago}.") 
