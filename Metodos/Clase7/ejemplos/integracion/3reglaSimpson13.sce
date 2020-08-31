clc()
clear all
function result=f(x)
    result = 0.2+25*x-200*x^2+675*x^3-900*x^4+400*x^5
endfunction

function result=reglaSimpson13(a,b,funcion)

    paso = (b-a)/2
    x0 = a
    x1 = a+paso
    x2 = b
    result = (x2-x0)*(funcion(x0)+4*funcion(x1)+funcion(x2))/6

    
endfunction

a = 0
b = 0.8
disp("integral")
integral = integrate("0.2+25*x-200*x^2+675*x^3-900*x^4+400*x^5",'x',a,b)
disp(integral)

aproximacion = reglaSimpson13(a,b,f)
disp(aproximacion)
disp("error")
disp((integral-aproximacion)*100/integral)
