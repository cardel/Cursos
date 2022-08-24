"""
Carlos A Delgado
12 de Junio de 2022
Ejemplo con numpy para ecuaciones lineales


"""
import numpy as np

"""
x + y = 10
2x - y = 22

"""
a = np.array([[1,1],[2,-1]])
b = np.array([10,22])
x = np.linalg.solve(a,b)
print(x)

"""
x+y+z = 22
2x+2y-z = 33
3x-6x+8z = 44
"""
a = np.array([[1,1,1],[2,2,-1],[3,-6,8]])
b = np.array([22,33,44])
x = np.linalg.solve(a,b)
print(x)