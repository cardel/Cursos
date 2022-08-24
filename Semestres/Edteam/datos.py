import pandas as pd
import numpy as np
import insertionsort, selectionSort, mergeSort, quickSort

data = pd.read_csv("train.csv")


precio = data["SalePrice"].dropna().values.tolist()
lot = data["LotFrontage"].dropna().values.tolist()
lotArea = data["LotArea"].dropna().values.tolist()
wood = data["WoodDeckSF"].dropna().values.tolist()

insertionsort.insertion_sort(precio)
print(precio[-1])
print(precio[0])

selectionSort.selection_sort(lot)
print(lot[-1])
print(lot[0])

mergeSort.mergeSort(lotArea,0,len(lotArea)-1)
print(lotArea[-1])
print(lotArea[0])

quickSort.quickSort(wood,0,len(lotArea)-1)
print(wood[-1])
print(wood[0])



