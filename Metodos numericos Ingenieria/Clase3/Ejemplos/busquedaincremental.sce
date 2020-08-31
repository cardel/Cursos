function [x, fx, xraices, fxraices] = busquedaincremental(funcion, xl, xu, ndivs)
    nraices = 0;
    xraices = [];
    x = linspace(xl, xu, ndivs);
    fx = funcion(x);
    for i = 1:length(x)-1
        if ( fx(i)*fx(i+1) < 0) then  // <= 0
            nraices = nraices + 1;
            xraices(nraices, 1) = x(i);
            xraices(nraices, 2) = x(i+1);
            fxraices(nraices, 1) = fx(i);
            fxraices(nraices, 2) = fx(i+1);      
        end
    end
    if (isempty(xraices)) then
        disp('No se encontraron raíces, modifique el intervalo o incremente la cantidad de intervalos');    
    else
        disp(nraices);
        disp(xraices);
    end
endfunction

clear all; clc;

function fx = funcion(x)
    fx = sin(10*x)+cos(3*x);
endfunction

// Realice pruebas con ndivs = 50 y ndivs = 100 y encuentre las diferencias
xl = 3, xu = 6, ndivs = 50
[x, fx, xraices, fxraices] = busquedaincremental(funcion, xl, xu, ndivs)

//Imprime todos los puntos y las raices
for i = 1:length(x)
    plot(x(i), fx(i), 'Color', 'blue', 'marker', '.')    
end
for i = 1:size(xraices, 1)
    plot(xraices(i,1), fxraices(i, 1), 'Color', 'red', 'marker', '.')    
    plot(xraices(i,2), fxraices(i, 2), 'Color', 'red', 'marker', '.')
end
xlabel('x',"fontsize", 5)
ylabel('f(x)',"fontsize", 5)
set(gca(),"grid",[1 1])
