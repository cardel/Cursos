"""
Carlos A Delgado
24 de Sep de 2022
Demostración que 2^(2x) es 4^x x sea entero positivo
"""
import matplotlib.pyplot as plt
import numpy as np

puntos = range(1,12)
f1 = list(map(lambda x:2**(2*x),puntos))
f2 = list(map(lambda x:4**x,puntos))

plt.figure(dpi=300)
plt.plot(puntos,f1,label=r"$2^{2x}$")
plt.plot(puntos,f2,label=r"$4^x$")
plt.legend()
plt.grid()
plt.savefig("demostracion.png")

puntos_continuos = np.linspace(-10,10,200)
f1c = list(map(lambda x:2**(2*x),puntos_continuos))
f2c = list(map(lambda x:4**x,puntos_continuos))

plt.figure(dpi=300)
plt.plot(puntos_continuos,f1c,label=r"$2^{2x}$")
plt.plot(puntos_continuos,f2c,label=r"$4^x$")
plt.legend()
plt.grid()
plt.savefig("demostracion_continua.png")

