a = lambda x,y: x+y
b = lambda a,b: a*b
c = lambda p,o,r: r(p,o)
d = lambda a,b: lambda c,d: a+b+c+d

print(a(2,3))
print(b(2,3))
print(c(4,3,a))
print(c(8,9,lambda m,n: m**n))
print(type(d(1,2)))
print(d(1,2)(1,3))