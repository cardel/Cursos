valor_consumido = float(input("Ingrese el consumo "))
estrato = int(input("Ingrese el estrato "))

if estrato == 1:
	valor_a_pagar = valor_consumido+500
elif estrato == 2:
	valor_a_pagar = valor_consumido + 700
elif estrato == 3:
        valor_a_pagar = valor_consumido + 4800
elif estrato==4:
	valor_a_pagar = valor_consumido + 6700
else:
       print("El estrato no es válido")

print("El valor a pagar es ",valor_a_pagar)