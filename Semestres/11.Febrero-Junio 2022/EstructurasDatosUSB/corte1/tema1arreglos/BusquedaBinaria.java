public class BusquedaBinaria {
    static int contador1 = 0;
    static int contador2 = 0;
    public static boolean buscar(int[] arreglo, int valor){
        for(int i=0;i<arreglo.length;i++){
            contador1++;
            if(arreglo[i]==valor){
                return true;
            }
        }
        return false;
    }

    public static boolean buscar_binaria(int [] arreglo,int p, int q, int valor){
        if(p<q){
            contador2++;
            int r = (p+q)/2;
            if(arreglo[r]==valor) return true;
            if(arreglo[r]<valor){
                return buscar_binaria(arreglo,r+1,q,valor);
            }
            else{
                return buscar_binaria(arreglo,p,r-1,valor);
            }
        }
        else{
            return arreglo[p]==valor;
        }
    }
    public static void main(String[] args){
        int[] arreglo = {1,2,3,4,5,6,7,8,10,12,1,23,123,12,312,312,321,3,213,21,321,321,3,123,12,321,312,321,3,213,213,12,312,312,3,555};
        System.out.println(buscar_binaria(arreglo, 0,arreglo.length-1,555));
        System.out.println(buscar(arreglo,555));
        System.out.println(contador1+" "+contador2);
    }

}
