"""
Carlos A Delgado 
19/05/2022
Ejemplo indentacion
"""
edad = 19
#Condicionales
if edad >= 18:
    print("Puede entrar")
    print("BIenvenido a la chiquiteta")
    while edad<=20:
        print(edad)
        edad=edad+2
    a = 8
else:
    print("No puede entrar")
a = 2
#Ciclo coming soon
while edad <= 100:
    print(edad)
    edad += 2

for i in range(10):
    print(i)

#Funciones
def funcion(n):
    a = n+2
    return a