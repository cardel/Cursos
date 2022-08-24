import sys
sys.setrecursionlimit(10000000)

def fib(n):
    if n==0 or n==1:
        return 1
    else:
        return fib(n-1)+fib(n-2)

print(fib(5))
print(fib(7))
print(fib(10))
print(fib(1000))