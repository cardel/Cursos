clf()
x = 5
i = 0:1:100
[e] = (length(i))
exacltyValue = exp(5)

e(1)=1 // n = 0
[issue] = (length(i))
issue(1) = 100*(exacltyValue-e(1))/exacltyValue


for n = 1:1:100
    e(n+1) = e(n) + 5^n/factorial(n)
    issue(n+1) = 100*(exacltyValue-e(n+1))/exacltyValue
end


//subplot(numeroFilas, numeroColumnas, numeroGrafica)
subplot(1,2,1)
plot(i,e,'marker','.','color','red')

subplot(1,2,2)
plot(i,issue,'marker','.','color','blue')

//Asumiendo 8 cifras significativas  Er = (0.5*10^-6)%
//Calculo del error conociendo el valor verdadero
Er = 0.5*10^(-6)
[bug] = (length(i))
bug(1) = 100*(exacltyValue-e(1))/exacltyValue


for n = 1:1:100
    e(n+1) = e(n) + 5^n/factorial(n)
    bug(n+1) = 100*(exacltyValue-e(n+1))/exacltyValue
    if bug(n+1) < Er
        break
    end
end

//Aca nos dio 23 iteraciones (Conociendo el valor exacto)

//Supongamos que NO conocemos el valor exacto

[bugAprox] = (length(i))
bugAprox(1) = 100000 //Inicialmente supongo un error muy grande

for n = 1:1:100
    e(n+1) = e(n) + 5^n/factorial(n)
    bugAprox(n+1)= 100*(e(n+1)-e(n))/e(n+1)
    if bugAprox(n+1) < Er
        break
    end
end


