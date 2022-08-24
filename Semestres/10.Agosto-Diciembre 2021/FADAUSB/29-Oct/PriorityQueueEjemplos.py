import PriorityQueue
import numpy as np

cola_prioridad = PriorityQueue.PriorityQueue()

cola_prioridad.build_priorityQueue(np.array([10,2,23,2,1,2,3,12,3,23,32]))
print(cola_prioridad.monticulo)

print(cola_prioridad.extract_max())
print(cola_prioridad.monticulo)

print(cola_prioridad.increase_key(9,30))
print(cola_prioridad.monticulo)
