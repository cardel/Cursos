"""
Carlos A Delgado
08 de Junio del 2022
Material de lista
"""
juguetes = ["muñeca","helicoptero","soldado de plástico","nevera de juguete"]
planetas =["mercurio","venus","tierra","martes"]
edad =[12,23,20,19,20]

print(juguetes[0])
print(planetas[1])
print(edad[-1])

print("tamaño "+str(len(juguetes)))
#Lista son mutables, puedo cambiarlas
print(juguetes)
juguetes[1]="carro chocón"
print(juguetes)

#insertar
juguetes.append("Láser")
print(juguetes)