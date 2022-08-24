%Problema de los computadores

var int: x_1; %Notebooks
var int: x_2; %Mesa

%Restricciones triviales
constraint x_1 >= 0;
constraint x_2 >= 0;

%Cada compuatador de mesa y notebook utiliza un chip de procesador, tenemos 10000
constraint x_1 + x_2 <= 10000;

%Cada computador de mesa tiene 2 chip de memoria y cada notebook tiene uno. Tenemos 15000
constraint x_1 + 2*x_2 <= 15000;

%Cada computador requiere 3 minutos y uno notebook tiene 4 minutos. Tenemos 25000
constraint 4*x_1+ 3*x_2 <= 25000;

solve maximize 750*x_1+1000*x_2;

output["x_1= ","\(x_1)","x_2= ","\(x_2)"];



