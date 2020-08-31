function [x, fx, xraices, fxraices] = busquedaincremental(funcion, xl, xu, ndivs)
    //****************************************//
    fid = mopen('matriz.dat', "w");
    if (fid == -1)
        error('cannot open file for writing');
    end    
    mfprintf(fid, "%s %s %s %s \n", 'x1', 'x2', 'fx1', 'fx2');        
    //****************************************//
    nraices = 0;
    xraices = [];
    x = linspace(xl, xu, ndivs);
    fx = funcion(x);
    for i = 1:length(x)-1
        if ( fx(i)*fx(i+1) < 0) then
            nraices = nraices + 1;
            xraices(nraices, 1) = x(i);
            xraices(nraices, 2) = x(i+1);
            fxraices(nraices, 1) = fx(i);
            fxraices(nraices, 2) = fx(i+1);
            //****************************************//
            mfprintf(fid, "%f %f %f %f \n", x(i), x(i+1), fx(i), fx(i+1));
            //****************************************//        
        end
    end
    if (isempty(xraices)) then
        disp('No se encontraron raíces, modifique el intervalo o incremente la cantidad de intervalos');    
    else
        disp(nraices);
        disp(xraices);
    end
    //****************************************//
    mclose(fid);   
    //****************************************//
endfunction