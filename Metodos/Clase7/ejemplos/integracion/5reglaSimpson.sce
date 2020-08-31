clc()
clear all
function result=f(x)
    result = 0.2+25*x-200*x^2+675*x^3-900*x^4+400*x^5
endfunction

function result=reglaSimpson38(a,b,funcion)

    h = (b-a)/3
    x0 = a
    x1 = x0+h
    x2 = x1+h
    x3 = b
    result=(b-a)*(funcion(x0)+3*funcion(x1)+3*funcion(x2)+funcion(x3))/8
   
endfunction

a = 0
b = 0.8
disp("integral")
integral = integrate("0.2+25*x-200*x^2+675*x^3-900*x^4+400*x^5",'x',a,b)
disp(integral)

aproximacion = reglaSimpson38(a,b,f)
disp(aproximacion)
disp("error")
disp((integral-aproximacion)*100/integral)
