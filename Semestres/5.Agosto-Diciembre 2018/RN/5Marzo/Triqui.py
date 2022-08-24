# encoding: utf-8
# Autor: Carlos Andres Delgado
# Ejemplo de tratamiento de datos

import pandas as pd
import numpy as np
from sklearn import model_selection, neural_network,preprocessing
data = pd.read_csv('tic-tac-toe.data') 


#Eliminar datos nulos
data = data.dropna()

#Eliminar duplicados
data = data.drop_duplicates()


X = data[data.columns.difference(['res'])]
y = data.loc[:,'res']


for i in ['p1', 'p2', 'p3', 'p4', 'p5', 'p6', 'p7', 'p8', 'p9']: 
	X.loc[:,i], val = pd.factorize(X.loc[:,i], sort=True)

print X


