"""
Carlos A Delgado
09 de Junio de 2022
Ayuda reto 3
"""

def AutoPartes(ventas):
    salida = {} #Construir el diccionario

    for idProducto,dProducto,pnProducto,cvProducto,sProducto,nComprador,cComprador,fVenta in ventas:
        #Lógica de insertar en el diccionario en la llave id producto una lista con los demás datos como lo piden en el enunciado
        print(idProducto,dProducto,pnProducto) #Eliminar
        pass #eliminar
        #Aqui usted debe seguir el ejemplo de cosmeticos        

    return salida

def consultaRegistro(ventas,id_producto):
    registro = AutoPartes(ventas)

    if(registro.get(id_producto)==None):
        return "No hay registro de venta de ese producto" 
    else:
        listaVentas = registro[id_producto]
        for idProducto, dProducto,pnProducto,cvProducto,sProducto,nComprador,cComprador,fVenta in listaVentas:
            salida = f"Producto consultado : {idProducto} Descripción {dProducto} #Parte {pnProducto} Cantidad vendida {cvProducto} Stock {sProducto} Comprador {nComprador} Documento {cComprador} Fecha Venta {fVenta}"
            print(salida) #Aqui si va con print

#No copiar esto cuando lo manden
ejemplo = [
    (2001,'rosca', 'PT29872',2,45,'Luis Molero',3456,'12/06/2020'),
    (2010,'bujía', 'MS9512',4,15,'Carlos Rondon',1256,'12/06/2020'),
    (2010,'bujía', 'ER6523',9,36,'Pedro Montes',1243,'12/06/2020'),
    (3578,'tijera', 'QW8523',1,128,'Pedro Faria',1456,'12/06/2020'),
    (9251,'piñón', 'EN5698',2,8,'Juan Peña',565,'12/06/2020')
]

print(consultaRegistro(ejemplo,2010))