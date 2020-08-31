clc()
clear all
function result=f(x)
    result = 0.2+25*x-200*x^2+675*x^3-900*x^4+400*x^5
endfunction

function result=reglaTrapecio(a,b,funcion)
    result = (b-a)*(funcion(a)+funcion(b))/2
endfunction

a = 0
b = 0.8
disp("integral")
integral = integrate("0.2+25*x-200*x^2+675*x^3-900*x^4+400*x^5",'x',a,b)
disp(integral)

aproximacion = reglaTrapecio(a,b,f)
disp(aproximacion)
disp("error")
disp((integral-aproximacion)*100/integral)
