var int: x1; %Combo popular
var int: x2; %Combo para la niña
var int: x3; %Combo para los enamorados
var int: C; %Función

solve maximize C;

constraint x1+x2+x3<=600;
constraint x1-2*x2 >= 0;
constraint x1-3*x3 >= 0;
constraint x2 -x3>=10;
constraint x3 <= 100;
constraint x1+x2 >= 200;
constraint C= 500*x1+400*x2+1000*x3;
constraint x1>=0;
constraint x2>=0;
constraint x3>=0;
constraint C>=0;


output ["Combo popular ",show(x1),"\n","Combo para la niña ",show(x2),"\n","Combo para los enamorados ",show(x3),"\nGanancias ",show(C)];
