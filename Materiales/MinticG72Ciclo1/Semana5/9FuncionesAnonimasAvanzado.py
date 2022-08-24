"""
Carlos A Delgado
12 de Junio de 2022
Carácteristicas avanzadas de las funciones anónimas
"""
funcion1 = lambda: True
print(funcion1)
print(funcion1())

funcion2 = lambda *args: args
print(funcion2)
print(funcion2())
print(funcion2(1))
print(funcion2(1,2,3,3,4,5,6))

funcion3 = lambda **kargs: kargs
print(funcion3())
funcion4 = lambda *args,**kargs: (args,kargs)
print(funcion4(1,2,hola=3))