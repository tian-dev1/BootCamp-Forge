public class Pitagoras {
    public static void main(String[] args){
        double resultado = calcularHipotenusa(20, 30);
        mostrarDatos(resultado);
    }

    private static double calcularHipotenusa(int catetoA, int catetoB){
        double hipotenusa = Math.sqrt(Math.pow(catetoA, 2) + Math.pow(catetoB, 2));
		return Math.round(hipotenusa * 100d) / 100d;
    }

    private static void mostrarDatos(double dato) {
        System.out.println("El dato es: " + dato);
    }
}
