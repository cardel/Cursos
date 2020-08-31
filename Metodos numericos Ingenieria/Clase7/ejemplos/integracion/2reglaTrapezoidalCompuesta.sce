clc()
clear all
function result=f(x)
    result = 0.2+25*x-200*x^2+675*x^3-900*x^4+400*x^5
endfunction

function result=reglaTrapecioCompuesta(a,b,n,funcion)
    result = 0
    paso = (b-a)/n
    x1 = a
    x2 = a+paso
    for i = 1:1:n
        result = result + (x2-x1)*(funcion(x1)+funcion(x2))/2
        x1 = x2
        x2 = x2 + paso
    end
    
endfunction

a = 0
b = 0.8
n = 5
disp("integral")
integral = integrate("0.2+25*x-200*x^2+675*x^3-900*x^4+400*x^5",'x',a,b)
disp(integral)

aproximacion = reglaTrapecioCompuesta(a,b,n,f)
disp(aproximacion)
disp("error")
disp((integral-aproximacion)*100/integral)
