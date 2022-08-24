"""
Carlos A Delgado
01 de Junio de 2022
Ejercicio sobre string
"""

def extraer_servidor_correo(mensaje):
    pos_arroba = mensaje.find("@")
    pos_espacio_despues_arroba = mensaje.find(" ",pos_arroba)
    srv = mensaje[pos_arroba+1:pos_espacio_despues_arroba]
    return srv

def extraer_hora_correo(mensaje):
    esp1 = mensaje.find(" ")
    esp2 = mensaje.find(" ",esp1+1) 
    esp3 = mensaje.find(" ",esp2+1)
    esp4 = mensaje.find(" ",esp3+1)
    esp5 = mensaje.find(" ",esp4+1)
    esp6 = mensaje.find(" ",esp5+1)
    esp7 = mensaje.find(" ",esp6+1)
    return mensaje[esp6+1:esp7]

#Para el viernes
def extraer_year(mensaje):
    esp1 = mensaje.find(" ")
    esp2 = mensaje.find(" ",esp1+1) 
    esp3 = mensaje.find(" ",esp2+1)
    esp4 = mensaje.find(" ",esp3+1)
    esp5 = mensaje.find(" ",esp4+1)
    esp6 = mensaje.find(" ",esp5+1)
    esp7 = mensaje.find(" ",esp6+1)
    return mensaje[esp7+1:]

def extraer_remitente(mensaje):
    ep1 = mensaje.find(" ")
    arroba = mensaje.find("@",ep1+1)
    return mensaje[ep1+1:arroba]


msg = "De Fernando@utp.edu.com Sabado 18 de Marzo 09:12:22 2010"
correo = extraer_servidor_correo(msg)
hora = extraer_hora_correo(msg)
anhio = extraer_year(msg)
remitente = extraer_remitente(msg)
print(correo,hora,anhio,remitente)

mg2 = "De maria@televisa.com.mx Lunes 19 de Diciembre 03:44:12 2022"
correo = extraer_servidor_correo(mg2)
hora = extraer_hora_correo(mg2)
anhio = extraer_year(mg2)
remitente = extraer_remitente(mg2)
print(correo,hora,anhio,remitente)

mg3 = "De reclamos@utp.edu.co Domingo 18 de Enero 12:33:20 2021"
correo = extraer_servidor_correo(mg3)
hora = extraer_hora_correo(mg3)
anhio = extraer_year(mg3)
remitente = extraer_remitente(mg3)
print(correo,hora,anhio,remitente)

mg4 = "De presidencia@gov.co Miercoles 20 de Enero 23:33:22 2021"
correo = extraer_servidor_correo(mg4)
hora = extraer_hora_correo(mg4)
anhio = extraer_year(mg4)
remitente = extraer_remitente(mg4)
print(correo,hora,anhio,remitente)
