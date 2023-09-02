public class HumanTest {
    public static void main(String[] args) {
        Human ninja1 = new Human("Cristian");
        Human samurai1 = new Human("Camilo");
        Human wizard1 = new Human("Maria");
        
        wizard1.attack(ninja1);
        samurai1.attack(ninja1);
        ninja1.attack(samurai1);
}
}
