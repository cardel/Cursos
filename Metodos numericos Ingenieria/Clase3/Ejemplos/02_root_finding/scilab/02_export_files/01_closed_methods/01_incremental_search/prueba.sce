//************** Ejecucion metodo busqueda incremental **************
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

