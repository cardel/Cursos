clc()
clear all
clf()

function result = solucionAnalitica(t)
    result = (4/1.3)*(exp(0.8*t)-exp(-0.5*t))+2*exp(-0.5*t)
endfunction

function result= eqdiff(y,t)
    result = 4*exp(0.8*t)-0.5*y
endfunction

function [result,points]=metodoHeun(stepsize,y0, t0, tf, eqf)
    points = t0:stepsize:tf

    result = (length(points))
    
    result(1) = y0
    
    for i=2:1:length(points)
       
       //Calculos en (t0,y0)
       ya=result(i-1)
       //Pendiente en el punto
       y0p = eqf(ya,points(i-1))

       //Calculamos el predictor
       predictor = ya + y0p
       
       //Con el predictor calculamos la pediente
       pendiente = eqf(predictor,points(i))
       
       //Con las pendientes obtenemos un promedio y se aplica el corrector
       promedioPendientes = (y0p + pendiente)*stepsize/2
        result(i) = ya + promedioPendientes
    end
endfunction

stepsize = 1
[results, points] = metodoHeun(stepsize,2,0,10,eqdiff)

solAnalitica = (length(points))
for i=1:1:length(points)
    solAnalitica(i) = solucionAnalitica(points(i))
end

plot(points,solAnalitica,"color","blue")
plot(points,results,"color","red")
legend(['Método analitico';'Método de Heun'],[-1])
xgrid()

