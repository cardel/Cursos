clc()
clear all

function [diferenciaAdelante, diferenciaAtras, diferenciaCentrada]=diferenciasFinitasSegundoOrden(h,x,funcion)
    xanterior = x - h
    xanterioranterior = x - 2*h
    
    xposterior = x+h
    xposteriorposterior =   x + 2*h
    
    fxanterioranterior =   horner(funcion,xanterioranterior)
    fxanterior = horner(funcion,xanterior)
    fx = horner(funcion,x)
    fxposterior = horner(funcion,xposterior)
    fxposteriorposterior = horner(funcion,xposteriorposterior)
    
    diferenciaAdelante = (-fxposteriorposterior+4*fxposterior-3*fx)/(2*h)
    
    diferenciaAtras = (3*fx-4*fxanterior+fxanterioranterior)/(2*h)
    
    diferenciaCentrada = (-fxposteriorposterior+8*fxposterior-8*fxanterior+fxanterioranterior)/(12*h)
   
endfunction

//Definir función
x = %s;
f = -0.1*x^4-0.15*x^3-0.5*x^2-0.25*x+1.2;

x0 = 0.5
//Evaluar derivada
df = derivat(f);


h = 0.25
disp("derivada exacta")
derivada = horner(df,x0)
disp(derivada)

[diffAdelante, diffAtras, diffCentrada] = diferenciasFinitasSegundoOrden(h,x0,f)

disp("Diferencia adelante")
disp(diffAdelante)
disp("error")
disp((derivada-diffAdelante)*100/derivada)

disp("Diferencia atrás")
disp(diffAtras)
disp("error")
disp((derivada-diffAtras)*100/derivada)

disp("Diferencia centrada")
disp(diffCentrada)
disp("error")
disp((derivada-diffCentrada)*100/derivada)
