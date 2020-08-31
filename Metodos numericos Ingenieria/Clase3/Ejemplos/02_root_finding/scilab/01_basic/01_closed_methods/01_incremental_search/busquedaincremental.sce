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
