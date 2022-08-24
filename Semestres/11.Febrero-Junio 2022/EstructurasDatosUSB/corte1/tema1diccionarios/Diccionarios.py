

diccionario1 = {"Nombre":"Carlos","Edad":34,"Gustos":["Ajedrez","Juego en linea","Comer"]}

print(diccionario1)
print(diccionario1["Nombre"])
print(diccionario1["Gustos"][1][2])


diccionarioCrazy = {1:"Hola",2:"Perro",True:"Hola mundo","Indice":223,
    0:"ajjaja",(1,2,3):23}

print(diccionarioCrazy[(1,2,3)])
print("**********************")
for e,k in diccionario1.items():
    print(e,k)

print(diccionario1.values())
print(diccionario1.keys())

