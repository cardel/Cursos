var 0.0..100.0: x1; var 0.0..100.0: x2; var 0.0..100.0: x3;
var 0.0..100.0: z;

 solve maximize z; 
 
 constraint z = 3*x1+x2+2*x3;
 
 constraint x1+x2+3*x3 <= 30;
 constraint 2*x1+2*x2+5*x3 <= 24;
 constraint 4*x1+x2+2*x3 <= 36;
 constraint x1>=0;
 constraint x2>=0;
 constraint x3>=0;
 
 output [" x1 ",show(x1),
 " x2 ",show(x2),
 " x3 ",show(x3),
 " z ",show(z)]