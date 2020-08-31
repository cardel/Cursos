//ejercicio x^10-1
clear all
clc()
function result = f(x)
    result = x^10-1
endfunction

function tabla = biseccion(xl,xu,funcion, n)
    [tabla] = (n)
    for i = 1:1:n
        xr = (xl+xu)/2
        tabla(i,1) = xl
        tabla(i,2) = xu
        tabla(i,3) = xr
        tabla(i,4) = f(xr)
        //Detectar cambio de signo
        if(funcion(xl)*funcion(xr)<0)
            xu = xr
        else
            xl = xr
        end
    end

endfunction


function tabla = falsaposicion(xl,xu,funcion, n)
    [tabla] = (n)
    for i = 1:1:n
        xr = xu-funcion(xu)*(xl-xu)/(funcion(xl)-funcion(xu))
        tabla(i,1) = xl
        tabla(i,2) = xu
        tabla(i,3) = xr
        tabla(i,4) = funcion(xr)
        //Detectar cambio de signo
        if(funcion(xl)*funcion(xr)<0)
            xu = xr
        else
            xl = xr
        end
    end

endfunction

iteraciones =20
tablaBiseccion= biseccion(0,1.3,f,iteraciones)
tablaFalsaposicion= falsaposicion(0,1.3,f,iteraciones)

disp("xu --- xl --- xr --- f(xr)")
disp(tablaBiseccion)
disp(tablaFalsaposicion)
