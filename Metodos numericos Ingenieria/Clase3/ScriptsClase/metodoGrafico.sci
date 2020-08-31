

function result = f(m)
    g = 9.81
    t = 4
    v = 36
    cD = 0.25
    result = sqrt(g*m/cD)*tanh(sqrt(g*cD/m)*t)-v
endfunction

m = linspace(140,145,100)

[fm] = (length(m))

for i=1:1:length(m)
    fm(i) = f(m(i))
end
clf()
plot(m,fm,'color','blue')
xgrid()

