"""
Carlos A Delgado
26 de Mayo de 2022
Parametros por defecto
Si un parámetro no ha sido enviado entonces le damos un valor por defecto
"""
def suma(a,b=0):
    return a+b

print(suma(2,4))
print(suma(2))