t = 0:2:10
g = 9.8
m = 68.1
cD = 12.5

//Método analitico
v = (g*m/cD)*(1-exp(-cD*t/m))

//Método de Euler
[ve] = (length(t))
ve(1) = 0

plot(t,v,'marker','>','color','red')
for i = 1:1:length(t)-1
    ve(i+1) = ve(i)+(g-cD*ve(i)/m)*(t(i+1)-t(i))
end

plot(t,ve,'marker','>','color','blue')


t2 = 0:0.5:10
[vf] = (length(t2))
vf(1) = 0

for i = 1:1:length(t2)-1
    vf(i+1) = vf(i)+(g-cD*vf(i)/m)*(t2(i+1)-t2(i))
end

plot(t2,vf,'marker','>','color','green')


xlabel('seg')
ylabel('$\frac{m}{s}$")
legend(['Método analitico';'Método de Euler'],[-1])
