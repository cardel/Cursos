import numpy as np 

arreglo1 = np.array([1,2,3,4,5,6,7,8,9,10])
arreglo2 = np.zeros(10)

arreglos2D = np.array([[1,2,3],[4,5,6],[7,8,9]])
print(arreglos2D)
print(arreglos2D[0])
print(arreglos2D[0][2])

arreglos3D = np.random.randint(0,40,(5,2,3))
#print(arreglos3D)
print(arreglos3D[0])

arreglo4D = np.random.randint(10,100,(4,3,2,10))
print(arreglo4D)