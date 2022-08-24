def formula(n):
  return 3*pow(3,n)-2*pow(2,n)

def recursivo(n):
  if n==0:
    return 1
  else:
    return 3*recursivo(n-1)+pow(2,n)


for i in range(0,21):
  print(" n ",i," recursiva: ",recursivo(i), " formula ",formula(i))
