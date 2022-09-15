def programa4(n):
  p = n
  k = 1
  print(p,k,2*(2**n)/2**p-1)
  while p>=0:
    k = k+k+1
    p = p -1 
    print(p,k,2*(2**n)/2**p-1)

programa4(20)
