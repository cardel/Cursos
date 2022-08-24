import math
def algoritmo1(n):
     i = 1
     res = 1
     print(i,res,math.factorial(i-1))
     while i<2*n:
          res *= i
          i+=1
          print(i,res,math.factorial(i-1))
     return res

print(algoritmo1(10))