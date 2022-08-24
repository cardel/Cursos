import matplotlib.pyplot as plt
import numpy as np 

x = np.linspace(0,20,100)
y1  = x
y2 = np.log(x)

plt.figure(dpi=300)
plt.plot(x,y1,label="n")
plt.plot(x,y2,label="log(n)")
plt.legend()
plt.show()
