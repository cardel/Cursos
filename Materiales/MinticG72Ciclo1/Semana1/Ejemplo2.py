"""
Carlos A Delgado
19/05/2022
Ejemplo de clase sobre variables
"""
a = 2 #Variable 1
b = 4 #Variable 2
c = a+b
print(c)

#Ejemplos de tipos
variableA = -4 #int
variableB = 3.4 #double/float
variableC = 'hola, soy una cadena de texto' #String
variableD = False #booleano
print("variableA",type(variableA))
print("variableB",type(variableB))
print("variableC",type(variableC))
print("variableD",type(variableD))
print("variableA (valor)",variableA)
variableA = "hola" #cambia, a partir de aqui variableA es un string
print("variableA",type(variableA))
print("variableA (valor)",variableA)

a = 8 #Numero entero
b = a
print("a+b",a+b)
a = "el chavo del "
b = '8' #Al tener comilla se nos vuelve un string (cadena de texto)
print("a+b",a+b)

#Manejo de Variables

i = 20
j = 30
j = i + j #Primero se resuelve lo del lado derecho y se asigna al lado izquierdo
