nombre = input("Ingrese su nombre ")
edad = float(input("Ingrese su edad "))
estrato = int(input("Ingrese su estrato "))

print(nombre,edad,estrato)

if edad >= 18:
    print(nombre+" es mayor de edad")
else:
    print(nombre+" es menor de edad")