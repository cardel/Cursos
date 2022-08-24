var int: x1; var int: x2; var int: x3; var int: x4; var int: x5;
var 0.0..100000.0: z;

%Costo por cada 100 gramos
solve minimize z;

%Restricciones
constraint 0.08*x1+0.25*x3+0.12*x4+0.08*x5 >= 550;
constraint 0.01*x1+0.9*x2+0.36*x3+0.03*x4>= 600;
constraint 0.55*x1+0.75*x4+0.5*x5 >= 2000;
constraint z = 0.25*x1+0.5*x2+1.2*x3+0.6*x4+1.5*x5;
constraint x1>=0;
constraint x2>=0;
constraint x3>=0;
constraint x4>=0;
constraint x5>=0;


output ["x1 Pan ",show(x1),
" x2 Mantequilla ",show(x2),
" x3 Queso ",show(x3),
" x4 Cereal ",show(x4),
" x5 Barra dietetica ",show(x5),
" costo: ", show(z),
" Total grasa ", show(0.01*x1+0.9*x2+0.36*x3+0.03*x4)
]