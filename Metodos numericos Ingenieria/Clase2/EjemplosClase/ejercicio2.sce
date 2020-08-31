
clf()
diffT = 2
t = 0:diffT:6

//Método análitico

xa = 101*exp(t.^2/2)-1

plot(t,xa,'marker','>','color','blue')

//Método de euler
[xb] = (length(t))
xb(1) = 100

for i = 1:1:length(t)-1
    xb(i+1) = diffT*t(i)*(1+xb(i))+xb(i)
end

plot(t,xb,'marker','>','color','red')

legend(["Método analitico";"Método de Euler"])

