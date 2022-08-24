"""
Carlos A Delgado
27-Agosto-2021
"""
import matplotlib.pyplot as plt

x1 = []
for i in range(0,10):
    x1.append(2*i**2)

x2 = []
for i in range(0,10):
    x2.append(i**2+2*i+1)

plt.figure(dpi=300)
plt.plot(range(0,10),x1,label=r"2x^2")
plt.plot(range(0,10),x2,label=r"x^2+2x+1")
plt.grid()
plt.legend()
plt.show()