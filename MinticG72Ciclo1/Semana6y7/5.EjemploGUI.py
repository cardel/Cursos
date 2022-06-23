"""
Carlos A Delgado
22 de Junio de 2022
Ejemplo de interfaces gráficas con Turtle
"""
import turtle

tortuga = turtle
tortuga.setup(800,800,0,0)
tortuga.screensize(800,800)
tortuga.title("Ejemplo de interfaces gráficas con Turtle")
tortuga.goto(0,0)
#Rutina para dibujar un cuadrado
tortuga.pendown()
tortuga.begin_fill()
for i in range(4):        
    tortuga.forward(100)
    tortuga.left(90)
tortuga.fillcolor("red")
tortuga.penup()
tortuga.end_fill()
#Rutina para dibujar un triangulo
tortuga.goto(-200,-200)
tortuga.pendown()

tortuga.begin_fill()
tortuga.forward(100)
tortuga.left(180-45)
tortuga.forward((100**2+50**2)**0.5)
tortuga.goto(-200,-200)
tortuga.penup()
tortuga.fillcolor("green")
tortuga.end_fill()

tortuga.goto(200,200)
tortuga.pendown()
tortuga.begin_fill()
tortuga.fillcolor("purple")
tortuga.forward(100)
tortuga.right(90)
tortuga.forward(200)
tortuga.goto(200,200)
tortuga.penup()
tortuga.end_fill()


tortuga.showturtle()
tortuga.mainloop()