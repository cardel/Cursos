"""
Carlos A Delgado
19/05/2022
Ejemplo de flujo de variable
"""
a = 8
b = 10
c = 12
print(a,b,c)

a = a+4 # A partir de aqui a vale 12
b = a*b # A partir de aqui b vale 120
c = c-b+a #12 - 120 + 12 = -96
print(a,b,c)

a = a+b #12+120=132 ok
b = b/2 #120/2 = 60
c = c-2*a #-96-2*132 = -96- 264 = -360
print(a,b,c)