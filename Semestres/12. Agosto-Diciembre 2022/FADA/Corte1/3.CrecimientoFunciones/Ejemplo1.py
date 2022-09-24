import matplotlib.pyplot as plt


puntos = range(0,7)

f1 = list(map(lambda x:x**2+4*x+17,puntos))
f2 = list(map(lambda x:2*x**3,puntos))

plt.figure(dpi=300)
plt.plot(puntos,f1,label=r"$x^2+4x+17$")
plt.plot(puntos,f2,label=r"$x^3$")
plt.legend()
plt.grid()
plt.savefig("ejemplo1.png")
