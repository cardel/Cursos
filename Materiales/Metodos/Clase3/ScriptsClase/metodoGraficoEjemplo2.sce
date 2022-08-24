clf()
function result = f(x)
    result = sin(10*x)+cos(3*x)
endfunction

x = linspace(3,6,500)

function raices = metodoIncremental(xl,xu,cantidadPuntos)
    puntos = linspace(xl,xu,cantidadPuntos)
    numeroRaicesDetectadas = 1
    [raices] = (cantidadPuntos)
    
    for i = 1:1:length(puntos)-1
     if f(puntos(i))*f(puntos(i+1)) < 0
        x = (puntos(i)+puntos(i+1))/2
        raices(numeroRaicesDetectadas) = x   
        numeroRaicesDetectadas=numeroRaicesDetectadas+1
        plot(x,f(x),'marker','o','color','red')
     end
    end

endfunction
r = metodoIncremental(3,6,500)

plot(x,f(x))
xgrid()
