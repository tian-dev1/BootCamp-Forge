public class StringManipulator {
	public static void main(String[] args) {

		// 1.- -----------------------
		System.out.println("1.- ------- trimAndConcat (str, str)--------");
		StringManipulator manipulator = new StringManipulator();

		String str = manipulator.trimAndConcat("   Hola    ", "   Mundo   ");
		System.out.println("(   Hola    ,    Mundo   ): " + str);

		// 2.- ------------------------

		System.out.println("\n2.-------- getIndexOrNull (str, char) --------");
		char letter = 'n';
		int a = manipulator.getIndexOrNull("Coding", letter);
		int b = manipulator.getIndexOrNull("Hola Mundo", letter);
		int c = manipulator.getIndexOrNull("Saludar", letter);
		System.out.printf("indice de la letra %c en <%s>: %d \n", letter, "Coding", a);
		System.out.printf("indice de la letra %c en <%s>: %d \n", letter, "Hola Mundo", b);
		System.out.printf("indice de la letra %c en <%s>: %d \n", letter, "Saludar", c);

		// 3.- ------------------------

		System.out.println("\n3.-------- getIndexOrNull (str, str) --------");
		String word = "Hola";
		String subString = "la";
		String notSubString = "mundo";
		int d = manipulator.getIndexOrNull(word, subString);
		int e = manipulator.getIndexOrNull(word, notSubString);
		System.out.printf("indice de la subcadena <%s> en <%s>: %d \n", subString, word, d);
		System.out.printf("indice de la subcadena <%s> en <%s>: %d \n", notSubString, word, e);

		// 4.- ------------------------

		System.out.println("\n4.-------- concatSubstring(str, int, int, str) --------");
		String word2 = manipulator.concatSubstring("Hola", 1, 3, "mundo");
		System.out.println("(Hola, 1, 3, mundo): " + word2);
	}
	
    public String trimAndConcat(String str, String str2) {
		String concatTrim = str.trim().concat(str2.trim());

		return concatTrim;
	}

	public int getIndexOrNull(String str, char letter) {
		int index = str.indexOf(letter);

		return index;
	}

	public int getIndexOrNull(String str1, String str2) {

		return str1.indexOf(str2);
	}

	public String concatSubstring(String str1, int init, int fin, String str2) {

		String subStr1 = str1.substring(init, fin);

		return subStr1.concat(str2);
	}
}
