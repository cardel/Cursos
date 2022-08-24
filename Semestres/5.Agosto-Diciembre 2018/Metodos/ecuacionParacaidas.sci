//Autor: Docente curso métodos númericos
//Fecha: 7 de Septiembre 2018
//Ejemplo de clase
clear all
clf
function f=ecuacionParacaidas(g,m,fr,t)
    f = m*g*(1-exp(-fr*t/m))/fr
endfunction

function f=ecuacionParacaidasB(g,m,fr,t)
    f = m*g*(exp(-fr*t/m))/fr
endfunction


g = 9.8
m = 68.1
fr = 12.5

// valor-inicial:incremento:valor-final
t = 0:1:20
resultado =ecuacionParacaidas(g,m,fr,t)
resultadoB =ecuacionParacaidasB(g,m,fr,t)


plot(t,resultado,"r-")
plot(t,resultadoB, "b>")
xtitle("Velocidad del paracaidista con respecto al tiempo")
xlabel("Tiempo (s)")
ylabel("Velocidad (m/s)")
legend(["Ecuación A","Ecuación B"],-1)


