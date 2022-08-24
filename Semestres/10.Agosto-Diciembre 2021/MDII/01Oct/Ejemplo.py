def generadorP5(n):
  if n==1:
    return ["0","1","2"]
  else:
    lista = generadorP5(n-1)
    salida = []
    for elm in lista:
      elm0 = elm+"0"
      elm1 = elm+"1"
      salida.append(elm0)
      salida.append(elm1)
      if elm[-1:]!="2":
        elm2 = elm+"2"
        salida.append(elm2)
      
    return salida

def formulaP5(n):
  if n==1:
    return 3
  elif n==2:
    return 8
  else:
    return 2*formulaP5(n-1)+2*formulaP5(n-2)

for i in range(1,20):
  print("n ",i," ProblemaP4 ",len(generadorP5(i))," Formula ",formulaP5(i))