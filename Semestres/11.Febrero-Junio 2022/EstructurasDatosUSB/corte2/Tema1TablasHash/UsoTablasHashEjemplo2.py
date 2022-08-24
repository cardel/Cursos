from TablasHash import HashTable
hashT = HashTable(100,True)

hashT.add("Carlos",10)
hashT.add("Juan",20)
hashT.add("Maria",30)
hashT.add("Pedro",300)

print(hashT.getValue("Maria"))
print(hashT.getValue("Sofia"))