
def hipotenusa(a,b):
    return (a**2+b**2)**0.5

def mayor(a,b):
    if a>b:
        return a
    else:
        return b

def funcion_sin_retorno(x,y,z):
    x = y+z
    z = 3+y
    y = 3*x+y
    print(x+y+z)
  
print(hipotenusa(2,4))
print(hipotenusa(3,6))
print(mayor(2,3))
print(mayor(2,1))
print(funcion_sin_retorno(1,2,3))
f = funcion_sin_retorno(4,5,2)
print(f)
"""
a= int(input("Ingrese el cateto a"))
b = int(input("Ingrese el cateto b"))
print(hipotenusa(a,b))
print(hipotenusa(b,a))
"""