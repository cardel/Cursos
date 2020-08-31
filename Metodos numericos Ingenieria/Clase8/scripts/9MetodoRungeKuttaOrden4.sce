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

function result=metodoRungeKuttaCuartoOrden(stepsize,y0, t0, tf, eqf)
    points = t0:stepsize:tf

    result = (length(points))
    
    result(1) = y0
    
    for i=2:1:length(points)
       
       ya = result(i-1)
       k1 = eqf(y0,points(i-1))
       k2 = eqf(y0+0.5*k1*stepsize,points(i-1)+0.5*stepsize)
       k3 = eqf(y0+0.5*k2*stepsize,points(i-1)+0.5*stepsize)
       k4 = eqf(y0+k3*stepsize,points(i-1)+stepsize)
       result(i) = ya+(1/6)*(k1+2*k2+2*k3+k4)*stepsize
    end
endfunction

tf = 4
stepsize = 1
[resultsA, pointsA] = metodoRungeKuttaMedio(stepsize,2,0,tf,eqdiff)

resultsB = metodoRungeKuttaCuartoOrden(stepsize,2,0,tf,eqdiff)


solAnalitica = (length(pointsA))
for i=1:1:length(pointsA)
    solAnalitica(i) = solucionAnalitica(points(i))
end

plot(pointsA,solAnalitica,"color","blue","marker","-")
plot(pointsA,resultsA,"color","red","marker","*")
plot(pointsA,resultsB,"color","green","marker",".")

legend(['Método analitico';'Método de Runge-Kutta a = 1/2';'Método de Runge-Kutta cuarto orden';],[-1])
xgrid()

