def operacion(f,valor):
    return f(valor)+f(valor**2)

print(operacion(lambda x: x+2,5))


def funcionRara(f,valor):
    return lambda x,y:f(x)+f(valor)+f(y)

print(funcionRara(lambda x:x**2,5))

print(funcionRara(lambda x:x**2,5)(3,4))