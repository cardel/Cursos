//Autor: Docente curso métodos númericos
//Fecha: 14 de Septiembre 2018
//Solución de problema de clase 
clear all
clf

function s=analitica(t)
    k = 1.3
    s = exp(-k*t)*20
endfunction

function c=euler()
    c(1) = 20
    k = 1.3
    t = [0,2,4,6]
    for ti = 2:1:length(t)
        c(ti) = -k*c(ti-1)*2 + c(ti-1)
    end
endfunction

function c=eulerDelta1()
    c(1) = 20
    k = 1.3
    t = [0,1,2,3,4,5,6]
    for ti = 2:1:length(t)
        c(ti) = -k*c(ti-1)*1 + c(ti-1)
    end
endfunction

function c=eulerExtremo()
    c(1) = 20
    k = 1.3
    t = 0:0.01:6
    for ti = 2:1:length(t)
        c(ti) = -k*c(ti-1)*0.01 + c(ti-1)
    end
endfunction

t=[0,2,4,6]
solAnalitica = analitica(t)

solEuler = euler()
solEuler2 = eulerDelta1()
solEulerExtrema = eulerExtremo()

plot(t,solAnalitica,"r-")
plot(t,solEuler, "b>-")
plot([0,1,2,3,4,5,6],solEuler2, "g>-")
xtitle("Concentración vs tiempo")
xlabel("Tiempo (s)")
ylabel("Concentración (kg)")
legend(["Solución analitica","Euler delta = 2","Euler delta = 1"],-1)
xgrid()


