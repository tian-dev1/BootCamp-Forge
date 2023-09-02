public class Test {
    public static void main(String[] args){
        Rompecabeza test = new Rompecabeza();
        
        int[] testArr = {3,5,1,2,7,9,8,13,25,32};
        test.sumAndGreaterThan10(testArr);
    
        String[] testList = {"Nancy", "Jinichi", "Fujibayashi", "Momochi", "Ishikawa"};
        test.shuffleStrings(testList);
    
        test.shuffleAlphabet();
    
        test.randNumber();
    
        test.randNumber2();
    
        test.randomString();
    
        test.randomStringOfStrings();
        }
}
