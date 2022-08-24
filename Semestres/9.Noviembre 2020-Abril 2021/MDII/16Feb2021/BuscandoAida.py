class nodo:
  def __init__(self, pos, recorridos, camino):
    self.pos = pos
    self.recorridos = recorridos
    self.camino = camino
  
class posicion:
  def __init__(self, posx, posy):
    self.posx = posx
    self.posy = posy

juego = [
  [0, 1, 0, 0, 0, 0],
  [3, 0, 3, 0, 4, 0],
  [3, 6, 0, 0, 0, 3],
  [5, 0, 0, 4, 0, 0],
  [3, 3, 3, 0, 2, 0],
  [3, 3, 4, 4, 0, 0],
]


def buscarElemento(lista, elemento):
  for i in lista:
    if i.posx == elemento.posx and i.posy == elemento.posy:
      return True

  else: 
    return False
  


inicio = nodo(posicion(0,1),[],[posicion(0,1)])

def busquedaAmplitud():
  cola = []
  cola.append(inicio)
  #busqueda amplitud
  while(True):
    if len(cola) == 0:
      print("No encontré")
      break

    nodoActual = cola.pop(0)
    posX = nodoActual.pos.posx
    posY = nodoActual.pos.posy
    #paro si encontré a Aida
    if juego[posX][posY] == 2:
      print("Encontre")
      break


    if not(juego[posX][posY] == 5 or juego[posX][posY] == 4 or juego[posX][posY] == 6):
      #arriba


      if(nodoActual.pos.posy>0):
        posicionNueva = posicion(nodoActual.pos.posx,nodoActual.pos.posy-1)
        recorridoA = nodoActual.recorridos.copy()
        caminoA = nodoActual.camino.copy()

      
        if buscarElemento(nodoActual.recorridos,posicionNueva)==False and juego[posicionNueva.posx
        ][posicionNueva.posy]!=3:
          recorridoA.append(nodoActual.pos)
          caminoA.append(posicionNueva)
          nuevoNodo = nodo(posicionNueva,recorridoA,caminoA)
          cola.append(nuevoNodo)

      #abajo
      if(nodoActual.pos.posy<len(juego)-1):
        posicionNueva = posicion(nodoActual.pos.posx,nodoActual.pos.posy+1)
        recorridoA = nodoActual.recorridos.copy()
        caminoA = nodoActual.camino.copy()

        if buscarElemento(nodoActual.recorridos,posicionNueva)==False and juego[posicionNueva.posx
        ][posicionNueva.posy]!=3:
          recorridoA.append(nodoActual.pos)
          caminoA.append(posicionNueva)
          nuevoNodo = nodo(posicionNueva,recorridoA,caminoA)
          cola.append(nuevoNodo)



      #izquierda
      if(nodoActual.pos.posx>0):
        posicionNueva = posicion(nodoActual.pos.posx-1,nodoActual.pos.posy)
        recorridoA = nodoActual.recorridos.copy()
        caminoA = nodoActual.camino.copy()
        if buscarElemento(nodoActual.recorridos,posicionNueva)==False and juego[posicionNueva.posx
        ][posicionNueva.posy]!=3:
          recorridoA.append(nodoActual.pos)
          caminoA.append(posicionNueva)
          nuevoNodo = nodo(posicionNueva,recorridoA,caminoA)

          cola.append(nuevoNodo)
      #derecha
      if nodoActual.pos.posx<len(juego)-1:
        posicionNueva = posicion(nodoActual.pos.posx+1,nodoActual.pos.posy)
        recorridoA = nodoActual.recorridos.copy()
        caminoA = nodoActual.camino.copy()

        if buscarElemento(nodoActual.recorridos,posicionNueva)==False and juego[posicionNueva.posx
        ][posicionNueva.posy]!=3:
          recorridoA.append(nodoActual.pos)
          caminoA.append(posicionNueva)

          nuevoNodo = nodo(posicionNueva,recorridoA,caminoA)
          cola.append(nuevoNodo)
    


  for i in nodoActual.camino:
    print(i.posx,i.posy)

def busquedaProfundida():
  pila = []
  pila.append(inicio)
  #busqueda amplitud
  while(True):
    if len(pila) == 0:
      print("No encontré")
      break

    nodoActual = pila.pop()
    posX = nodoActual.pos.posx
    posY = nodoActual.pos.posy
    #paro si encontré a Aida
    if juego[posX][posY] == 2:
      print("Encontre")
      break


    if not(juego[posX][posY] == 5 or juego[posX][posY] == 4 or juego[posX][posY] == 6):

      #derecha
      if nodoActual.pos.posx<len(juego)-1:
        posicionNueva = posicion(nodoActual.pos.posx+1,nodoActual.pos.posy)
        recorridoA = nodoActual.recorridos.copy()
        caminoA = nodoActual.camino.copy()

        if buscarElemento(nodoActual.recorridos,posicionNueva)==False and juego[posicionNueva.posx
        ][posicionNueva.posy]!=3:
          recorridoA.append(nodoActual.pos)
          caminoA.append(posicionNueva)

          nuevoNodo = nodo(posicionNueva,recorridoA,caminoA)
          pila.append(nuevoNodo)
      #arriba


      if(nodoActual.pos.posy>0):
        posicionNueva = posicion(nodoActual.pos.posx,nodoActual.pos.posy-1)
        recorridoA = nodoActual.recorridos.copy()
        caminoA = nodoActual.camino.copy()

      
        if buscarElemento(nodoActual.recorridos,posicionNueva)==False and juego[posicionNueva.posx
        ][posicionNueva.posy]!=3:
          recorridoA.append(nodoActual.pos)
          caminoA.append(posicionNueva)
          nuevoNodo = nodo(posicionNueva,recorridoA,caminoA)
          pila.append(nuevoNodo)

      #abajo
      if(nodoActual.pos.posy<len(juego)-1):
        posicionNueva = posicion(nodoActual.pos.posx,nodoActual.pos.posy+1)
        recorridoA = nodoActual.recorridos.copy()
        caminoA = nodoActual.camino.copy()

        if buscarElemento(nodoActual.recorridos,posicionNueva)==False and juego[posicionNueva.posx
        ][posicionNueva.posy]!=3:
          recorridoA.append(nodoActual.pos)
          caminoA.append(posicionNueva)
          nuevoNodo = nodo(posicionNueva,recorridoA,caminoA)
          pila.append(nuevoNodo)



      #izquierda
      if(nodoActual.pos.posx>0):
        posicionNueva = posicion(nodoActual.pos.posx-1,nodoActual.pos.posy)
        recorridoA = nodoActual.recorridos.copy()
        caminoA = nodoActual.camino.copy()
        if buscarElemento(nodoActual.recorridos,posicionNueva)==False and juego[posicionNueva.posx
        ][posicionNueva.posy]!=3:
          recorridoA.append(nodoActual.pos)
          caminoA.append(posicionNueva)
          nuevoNodo = nodo(posicionNueva,recorridoA,caminoA)

          pila.append(nuevoNodo)

    


  for i in nodoActual.camino:
    print(i.posx,i.posy)

print("Búsqueda por amplitud")
print(busquedaAmplitud())

print("Búsqueda por profundidad")
print(busquedaProfundida())
