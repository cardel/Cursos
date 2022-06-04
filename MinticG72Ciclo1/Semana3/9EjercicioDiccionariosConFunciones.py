"""
Carlos A Delgado S
03 Junio de 2022
Este programa permite estudiar cómo se generan diccionarios como retorno de funciones
"""
def generarReporteNotas(dicNotas):
    """
    Esta función recibe un diccionario con las notas de un beneficiario, y nos retorna un diccionario que tiene el promedioPendientes
    """
    nombre = dicNotas["estudiante"]
    nota1 = dicNotas["nota1"]
    nota2 = dicNotas["nota2"]
    nota3 = dicNotas["nota3"]
    nota4 = dicNotas["nota4"]
    promedio = round((nota1 + nota2 + nota3 + nota4)/4,2)

    resumen = {}
    resumen["estudiante"] = nombre
    resumen["promedio"] = promedio
    return resumen

def reporteNotas(reporte):
    """
    Esta función recibe un diccionario con el reporte del estudiante,
    retornamos un str con la información formateada (para un usuario final)
    """
    nom = reporte["estudiante"]
    prom = reporte["promedio"]
    return "El/la estudiante "+nom+" tiene un promedio de "+str(prom)

estudiante = {}
estudiante["estudiante"] = "Maria Lozano"
estudiante["nota1"] = 4.0
estudiante["nota2"] = 4.3
estudiante["nota3"] = 3.8
estudiante["nota4"] = 5.0
resultado = generarReporteNotas(estudiante)
reporte = reporteNotas(resultado)
print(reporte)