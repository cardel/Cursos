"""
Carlos A Delgado
03 de Junio de 2022
Calculadora
"""
from tkinter import *
from tkinter.ttk import * 
import numpy as np
#Logica

num1array = np.array([])
num2array = np.array([])
print(num1array,num2array)

def resultado():
    accion = seleccion.get(seleccion.curselection())
    num1 = float(input1.get())
    num2 = float(input2.get())
    if accion == "Suma":
        res = str(num1+num2)
    elif accion == "Resta":
        res = str(num1-num2)
    elif accion == "División":
        res = str(num1/num2)
    else:
        res = str(num1*num2)
    salida.configure(state=NORMAL)
    salida.delete(0,END)
    salida.insert(0, res)
    salida.configure(state=DISABLED)
    print(num1array,num2array)
    
def agregar():
    accion = seleccion.get(seleccion.curselection())
    num1 = input1.get()
    num2 = input2.get()
    global num1array,num2array
    num1array = np.insert(num1array,num1array.shape[0],float(num1))
    num2array = np.insert(num2array,num2array.shape[0],float(num2))

    etiqueta4.insert(END,"\n"+accion+'\t'+num1+'\t'+num2)


#Crear la interfaz
interfaz = Tk()
interfaz.geometry("800x800")
interfaz.title("Mi primera calculadora")
interfaz.configure(bg="#faedcd")
interfaz.resizable (False,False)
#interfaz.bgcolor("blue")
#Manejador de los elementos
s = Style()
s.configure('My.TFrame', background='#faedcd')

frame = Frame(interfaz,padding=10,style='My.TFrame')
frame.grid()

Label(frame,text="Mi primera calculadora",font=20,justify="center").grid(row=0,column=0,columnspan=2)

etiqueta1 = Label(frame,text="Ingrese el primer número",justify="center")
etiqueta1.grid(row=1,column=0)

input1 = Entry(frame)
input1.grid(row=1,column=1)
input1.configure(width=10)


etiqueta2 = Label(frame,text="Ingrese el segundo número")
etiqueta2.grid(row=2,column=0)

input2 = Entry(frame,justify="center")
input2.grid(row=2,column=1)

boton = Button(frame,text="Calcular",command=resultado)
boton.grid(row=4,column=0,columnspan=2)

etiqueta3 = Label(frame,text="Resultado")
etiqueta3.grid(row=5,column=0)

salida = Entry(frame,state=DISABLED)
salida.grid(row=5,column=1)

boton2 = Button(frame,text="Agregar",command=agregar)
boton2.grid(row=6,column=0,columnspan=2)

etiqueta4 = Text(frame)
etiqueta4.insert('1.0',"Accion\tNumero 1\tNumero 2")
etiqueta4.grid(row=7,column=0,columnspan=2)

seleccion = Listbox(frame,selectmode="browse")
seleccion.insert(END,"Suma")
seleccion.insert(END,"Resta")
seleccion.insert(END,"División")
seleccion.insert(END,"Multiplicación")
seleccion.select_set(2)
seleccion.grid(row=3,column=0,columnspan=2)


interfaz.mainloop() #No se cierra
