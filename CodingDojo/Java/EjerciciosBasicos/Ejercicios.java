public class Ejercicios {
    public static void main(String[] args) {
        Test test = new Test();

        test.print1To255();

        test.printOdd1To255();

        test.printSum();

        int[] testArr = {-9,-7,-5,-3,-1,0,1,3,5,7,9};
        test.iterateArray(testArr);

        int[] testArr2 = {-9,-7,-5,-3,-1,0,1,3,5,7,9};
        test.findMax(testArr2);

        int[] testArr3 = {-9,-7,-5,-3,-1,0,1,3,5,7,9};
        test.getAverage(testArr3);

        test.arrayOddNumbers();

        int[] testArr4 = {-9,-7,-5,-3,-1,0,1,3,5,7,9};
        test.greaterThanY(testArr4, 3);

        int[] testArr5 = {-9,-7,-5,-3,-1,0,1,3,5,7,9};
        test.squareTheValues(testArr5);

        int[] testArr6 = {-9,-7,-5,-3,-1,0,1,3,5,7,9};
        test.eliminateNegativeNumbers(testArr6);

        int[] testArr7 = {-9,-7,-5,-3,-1,0,1,3,5,7,9};
        test.maxMinAvg(testArr7);

        int[] testArr8 = {-9,-7,-5,-3,-1,0,1,3,5,7,9};
        test.shiftingValues(testArr8);


    }

}
