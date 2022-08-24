
function result=f(x)
    result = 0.2+25*x-200*x^2+675*x^3-900*x^4+400*x^5
endfunction

function I = trapezoidal(a,b)
    I = (b-a)*(f(a)+f(b))/2
    
endfunction

//Regla trapezoidal compuesta
function I = trapezoidalCompuesto(a,b,n)
    
    h = (b-a)/n
    I = 0
    
    intervaloInferior = a
    intervaloSuperior = a + h
    for segmento = 1:1:n
        //disp("Integral entre "+string(intervaloInferior)+ " y "+ string(intervaloSuperior))
        I = I + (intervaloSuperior -intervaloInferior)*(f(intervaloInferior)+(f(intervaloSuperior)))/2
        
        intervaloInferior = intervaloSuperior
        intervaloSuperior = intervaloSuperior + h
    end
endfunction

function I = reglaSimpson13(a,b)
    h = (b-a)/2
    intermedio = a + h
    
    I = (b-a)*(f(a)+4*f(intermedio)+f(b))/6
    
endfunction

function I = reglaSimpsonCompuesta(a,b,n)
    
    //n debe ser par y n >= 2
    if modulo(n,2) == 1 or n < 2 then
        disp("n inválido")
        I = 0
        return
    end
    
    h = (b-a)/n
    
    //a, a+h, a+2h primer simpson
    //a+2h, a+3h, a+4h segundo simpson
    //a+4h, a+5h, a+6h
    x0 = a
    x1 = a + h
    x2 = a + 2*h    
    I = 0
    for segmento = 1:2:n
        I = I + (x2-x0)*(f(x0)+4*f(x1)+f(x2))/6
        x0 = x2
        x1 = x2 + h
        x2 = x2 + 2*h
    end
    
endfunction

disp("Método trapezoidal")
vE = 1.640533
a = 0
b = 0.8
MT = trapezoidal(a,b)
eRT = abs((vE-MT)*100/vE)
disp("Estimación "+string(MT)+ " error relativo "+ string(eRT)+"%")
disp("Método trapezoidal compuesto")
n = 10
MTI = trapezoidalCompuesto(a,b,n)
eRTI = abs((vE-MTI)*100/vE)
disp("Estimación "+string(MTI)+ " error relativo "+ string(eRTI)+"%")

disp("Regla de simpson 1/3")

MTS13 = reglaSimpson13(a,b)
eRTS13 = abs((vE-MTS13)*100/vE)
disp("Estimación "+string(MTS13)+ " error relativo "+ string(eRTS13)+"%")

disp("Regla de simpson 1/3 compuesta")
MTS13C = reglaSimpsonCompuesta(a,b,n)
eRTS13C = abs((vE-MTS13C)*100/vE)
disp("Estimación "+string(MTS13C)+ " error relativo "+ string(eRTS13C)+"%")
