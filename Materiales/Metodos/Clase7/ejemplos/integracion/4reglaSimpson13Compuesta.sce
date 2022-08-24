clc()
clear all
function result=f(x)
    result = 0.2+25*x-200*x^2+675*x^3-900*x^4+400*x^5
endfunction

function result=reglaSimpson13Compuesta(a,b,n,funcion)

    h = (b-a)/n
    x0 = a
    x1 = x0+h
    x2 = x1+h
    result = 0
    for i = 1:1:n/2 
         result = result+2*h*(funcion(x0)+4*funcion(x1)+funcion(x2))/6
        x0 = x2
        x1 = x0+h
        x2 = x1+h
    end


    
endfunction

a = 0
b = 0.8
n = 4
disp("integral")
integral = integrate("0.2+25*x-200*x^2+675*x^3-900*x^4+400*x^5",'x',a,b)
disp(integral)

aproximacion = reglaSimpson13Compuesta(a,b,n,f)
disp(aproximacion)
disp("error")
disp((integral-aproximacion)*100/integral)
