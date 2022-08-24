clear all
function resultado = funcionParacaidas(m)
    Cd = 0.25
    g = 9.81
    t = 4
    v = 36
    resultado = sqrt(g*m/Cd)*tanh(sqrt(g*Cd/m)*t)-v
endfunction

function Tabla = falsaPosicion(xl,xu)
    
    for i = 1:1:10
        fxl = funcionParacaidas(xl)
        
        xr = xu - (funcionParacaidas(xu)*(xl-xu))/(funcionParacaidas(xl)-funcionParacaidas(xu))
        fxr = funcionParacaidas(xr)
        
        fxu = funcionParacaidas(xu)

        Tabla(i,1) = i
        Tabla(i,2) = fxr
        Tabla(i,3) = xl
        Tabla(i,4) = xr
        Tabla(i,5) = xu
        
        if fxl*fxr < 0
            xu = xr
        else
            xl = xr
        end
        

        
        
    end
    
endfunction
