import matplotlib.pyplot as plt
import numpy as np

plt.figure(dpi=300)
x = np.linspace(0,20,100)
y1 = [n**2-n+2 for n in x]
y2 = [2*n**2 for n in x]
plt.plot(x,y1,label="f(n)")
plt.plot(x,y2,label="O(n^2")
plt.grid()
plt.legend()
plt.show()