import matplotlib.pyplot as plt

def recurrencia(n):
    if n==1:
        return 4
    else:
        return 4*recurrencia(n/2)+n

def cota(n,c):
    return c*n**2+n


x = [2**x for x in range(0,10)]

plt.figure(dpi=300)

y1 = [recurrencia(n) for n in x]
y2 = [cota(n,1) for n in x]
y3 = [cota(n,10) for n in x]

for x_i, y1_i, y2_i, y3_i in zip(x,y1,y2,y3):
    print("n ",x_i," RR ",y1_i," Cota i",y2_i," Cota s ",y3_i)

plt.figure(dpi=300)
plt.plot(x,y1,"r-", label="RR")
plt.plot(x,y2,"b-", label="Cota inferior")
plt.plot(x,y3,"y-", label="Cota superior")
plt.grid()
plt.tight_layout()
plt.legend()
plt.show()