
def warsall(MR):
  n = len(MR)
  for k in range(0,n):
    for i in range(0,n):
      for j in range(0,n):
        MR[i][j] = MR[i][j] or (MR[k][j] and MR[i][k])


MR1 = [
  [0,1,1,1],
  [1,0,0,1],
  [1,0,0,1],
  [1,1,1,0]
]

MR2 = [
  [1,1,1,1],
  [0,0,0,1],
  [1,1,0,0],
  [0,1,1,1]
]

warsall(MR1)
print(MR1)
warsall(MR2)
print(MR2)
