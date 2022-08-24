"""
Carlos A Delgado
24 de Junio de 2022

Por ejemplo tengo la lista [1000,500,600,700,5000,90000,17500]

Diseñe la función

modificar_lista(lst):
	pass #Esto se borra

La idea es sumar 2000 unicamente a los elementos menores a 8000, en el
caso anterior la salida eria

[3000,2500,2600,2700,7000,90000,17500]

Primero hacerlo con el for / if 
Luego hacerlo con map (if) y filter

"""

def modificar_lista_v1(lst):
    lstF = []
    for elm in lst:
        if elm < 8000:
            lstF.append(elm+2000)
        else:
            lstF.append(elm)
    
    return lstF

def modificar_lista_v2(lst):
    lstF = list(map(lambda x: x+2000 if x<8000 else x,lst))
    return lstF

print(modificar_lista_v1([1000,500,600,700,5000,90000,17500]))
print(modificar_lista_v2([1000,500,600,700,5000,90000,17500]))
#[3000,2500,2600,2700,7000,90000,17500]