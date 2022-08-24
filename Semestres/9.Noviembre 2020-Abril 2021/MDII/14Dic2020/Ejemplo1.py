

def solucionRecursiva(n):
  if n == 1:
    return 3
  elif n == 2:
    return 8
  else:
    return 2*solucionRecursiva(n-1)+2*solucionRecursiva(n-2)

def solucionIterativa(n):
  if n == 1:
    return ["0","1","2"]
  else:
    solucionAnterior = solucionIterativa(n-1)
    salida = []
    for et in solucionAnterior:
      salida.append(et+"0")
      salida.append(et+"1")

      if et[-1]!="2":
        salida.append(et+"2")

    return salida

for i in range(1,12):
  print("n = ",i," fr(n) ",solucionRecursiva(i), " freal(n) ", len(solucionIterativa(i)))

#print(solucionIterativa(1))
#print(solucionIterativa(4))