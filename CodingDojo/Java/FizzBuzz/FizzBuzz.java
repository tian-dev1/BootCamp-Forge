public class FizzBuzz {
    public static void main(String[] args){
        String resultado = fizzBuzz(20);
        System.out.println(resultado);
    }

    private static String fizzBuzz(int number){
        String result = "";

		if (number % 3 == 0 && number % 5 == 0) {
			result = "FizzBuzz";
		} else if (number % 3 == 0) {
			result = "Fizz";
		} else if (number % 5 == 0) {
			result = "Buzz";
		} else {
			System.out.println(number);
		}

		String fizzBuzz = String.format("%d: %s", number, result);

		return fizzBuzz;
    }

}
