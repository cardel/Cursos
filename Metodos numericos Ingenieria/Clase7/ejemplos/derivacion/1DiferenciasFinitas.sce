clc()
clear all

function [diferenciaAdelante, diferenciaAtras, diferenciaCentrada]=diferenciasFinitas(h,x,funcion)
    xanterior = x - h
    xposterior = x+h
    
    fxanterior = horner(funcion,xanterior)
    fx = horner(funcion,x)
    fxposterior = horner(funcion,xposterior)
    
    
    diferenciaAdelante = (fxposterior - fx)/h
    
    diferenciaAtras = (fx - fxanterior)/h
    
    diferenciaCentrada = (fxposterior - fxanterior)/(2*h)
   
endfunction

//Definir función
x = poly(0,"x");
f = -0.1*x^4-0.15*x^3-0.5*x^2-0.25*x+1.2;

x0 = 0.5
//Evaluar derivada
df = derivat(f);


h = 0.25
disp("derivada exacta")
derivada = horner(df,x0)
disp(derivada)

[diffAdelante, diffAtras, diffCentrada] = diferenciasFinitas(h,x0,f)

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
