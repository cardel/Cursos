"""
Carlos A Delgado
27 de Mayo de 2022
Ejemplos de arreglo 2D
"""
import numpy as np

arr1 = np.array(
    [
        [1, 2, 3, 4],
        [2, 4, 6, 8],
        [10, 12, 14, 16],
        [20, 30, 40, 50]
    ]
)
print(arr1)
print("Direccionar")
print("pos 0",arr1[0])
print("pos 1",arr1[1])
print("pos 2",arr1[2])
print("pos 3",arr1[3])

print("pos 0,1:",arr1[0][1])
print("pos 3,2:",arr1[3][2])
print(arr1.shape[1])
for i in range(0,arr1.shape[0]): #Acceder a los arreglos internos
    for j in range(0,arr1.shape[1]): #Acceder a los elementos dentro de los arreglos internos
        print("pos",i,j,":",arr1[i][j])


arr2 = np.zeros((4,5))
print(arr2)

arr3 = np.full((5,6),"nulo")
print(arr3)

arr4 = np.random.random((4,5))
print(arr4)

arr5 = np.random.randint(10,100,(5,5))
print(arr5)