import matplotlib.pyplot as plt
import math

x = [x for x in range(1,20)]
y1 = [y**2 for y in x]
y2 = [y*math.log2(y) for y in x]

plt.figure(dpi=300)
plt.plot(x,y1,label=r"n^2")
plt.plot(x,y2,label="nlog(n)")
plt.legend()
plt.tight_layout()
plt.show()