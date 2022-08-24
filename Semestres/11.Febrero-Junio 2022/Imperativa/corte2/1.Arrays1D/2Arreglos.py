import numpy as np 

planetas = np.array(["mercurio","venus","tierra","marte","jupiter",
                  "saturno","urano","neptuno"])

print(planetas.shape)
print(planetas.shape[0])
print(planetas.size)

for index in range(planetas.shape[0]):
    print(planetas[index])

print("===================")

for elemento in planetas:
    print(elemento)