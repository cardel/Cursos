from TablasHash import HashTable
import matplotlib.pyplot as plt
import random
import numpy as np
hashT = HashTable(100,True)
hashT2 = HashTable(100,False)
try:
    archivo = open("names.txt", "r")
    for line in archivo:
        hashT.add(line,random.randint(1,10000))
        hashT2.add(line,random.randint(1,10000))
except:
    print("problema cargando el archivo")

num = []
num2 = []
for i in range(0,len(hashT.table)):
    num.append(len(hashT.table[i]))
    num2.append(len(hashT2.table[i]))

plt.figure(dpi=200)
plt.bar(range(len(hashT.table)),num)
plt.savefig("metodoDivision.png")


plt.figure(dpi=200)
plt.bar(range(len(hashT2.table)),num2)
plt.savefig("metodoMulti.png")

print("EL maximo del metodo de la división esta en ",np.argmax(np.array(num))," y vale ",np.max(np.array(num)))

print("EL maximo del metodo de la multplicación esta en ",np.argmax(np.array(num2))," y vale ",np.max(np.array(num2)))
