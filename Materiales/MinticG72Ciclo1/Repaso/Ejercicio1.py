def determinar_edad(edad):
 
    if edad >= 0 and edad < 10:
        return 'Atracción Carros chocones'
    elif edad >= 10 and edad < 20:
        return 'X-treme'
    elif edad >= 20 and edad < 30:
        return 'Sillas voladoras'
    elif edad >= 30 and edad < 60:
        return 'Paseo romántico'
    elif edad >= 60:
        return 'Viaje relajado'
    else:
        return 'La edad no es correcta'

print(determinar_edad(10))
print(determinar_edad(20))
print(determinar_edad(-10))