clc()
clear all
clf()
function result = solucionAnalitica(t)
    result = (4/1.3)*(exp(0.8*t)-exp(-0.5*t))+2*exp(-0.5*t)
endfunction

function result= eqdiff(y,t)
    result = 4*exp(0.8*t)-0.5*y
endfunction

function [result,points]=metodoRungeKuttaMedio(stepsize,y0, t0, tf, eqf)
    points = t0:stepsize:tf

    result = (length(points))
    
    result(1) = y0
    
    for i=2:1:length(points)
       
       ya = result(i-1)
       k1 = eqf(y0,points(i-1))
       k2 = eqf(y0+0.5*k1*stepsize,points(i-1)+0.5*stepsize)
       result(i) = ya+k2*stepsize
    end
endfunction

stepsize = 1
[results, points] = metodoRungeKuttaMedio(stepsize,2,0,10,eqdiff)

solAnalitica = (length(points))
for i=1:1:length(points)
    solAnalitica(i) = solucionAnalitica(points(i))
end

plot(points,solAnalitica,"color","blue")
plot(points,results,"color","red")
legend(['Método analitico';'Método de Runge-Kutta a = 1'],[-1])
xgrid()

