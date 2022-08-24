
//Autor: Docente curso métodos númericos
//Fecha: 7 de Septiembre 2018
//Solución de problema
clear all
clf
function f=ecuacionParacaidas(g,m,fr,t)
    f = m*g*(1-exp(-fr*t/m))/fr
endfunction


g1 = 9.8
m1 = 68.1
fr1 = 12.5

// valor-inicial:incremento:valor-final
t = 0:1:20
resultadoP1 =ecuacionParacaidas(g1,m1,fr1,t)

g2 = 9.8
m2 = 85
fr2= 15


resultadoP2 =ecuacionParacaidas(g2,m2,fr2,t)

plot(t,resultadoP1,"r-")
plot(t,resultadoP2, "b>-")
xtitle("Velocidad del paracaidista con respecto al tiempo")
xlabel("Tiempo (s)")
ylabel("Velocidad (m/s)")
legend(["Ecuación paracaidista 1","Ecuación paracaidista 2"],-1)
xgrid()

