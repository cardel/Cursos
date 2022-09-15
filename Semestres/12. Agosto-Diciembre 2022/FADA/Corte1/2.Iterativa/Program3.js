

function algoritmo1(n){
   let a = 0;
   let s = 0;
   console.log(a,s,a*n);
   while(a<=n){
    s+= 2*n;
    a+=2;
    console.log(a,s,a*n);
   }
}
let n = 12;
algoritmo1(n);
console.log(n*(n+2));
