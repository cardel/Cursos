import math

def pos(key):
    return math.floor(4*(0.61083*key % 1))

for x in [5,9,13,17,21,25,29]:
    print(pos(x))
