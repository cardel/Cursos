import numpy as np
import matplotlib.pyplot as plt
print(np.roots([1,-1,-4,-17]))
x= 3.51448558
print(x**3-x**2-4*x-17)

funcion = lambda x: x**2+4*x+17
funcion2 = lambda x: x**3

x = np.linspace(0,10,100)
plt.figure(dpi=200)
plt.plot(x,funcion(x),label=r"x^2+4x+17")
plt.plot(x,funcion2(x),label=r"x^3")
plt.legend()
plt.show()