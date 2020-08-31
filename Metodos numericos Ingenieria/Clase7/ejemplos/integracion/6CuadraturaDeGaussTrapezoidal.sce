clc()
clear all
function result=f(x,a,b)
    xd = (b-a)*x/2+(b+a)/2
    dx = (b-a)/2
    result =dx*( 0.2+25*xd-200*xd^2+675*xd^3-900*xd^4+400*xd^5)
endfunction

function result=cuadraturaDeGaussTrapezoidal(a,b,funcion)

    result=(b-a)*(funcion(a,a,b)+funcion(b,a,b))/2
   
endfunction

a = 0
b = 0.8
disp("integral")
integral = integrate("0.2+25*x-200*x^2+675*x^3-900*x^4+400*x^5",'x',a,b)
disp(integral)

aproximacion = cuadraturaDeGaussTrapezoidal(a,b,f)
disp(aproximacion)
disp("error")
disp((integral-aproximacion)*100/integral)
