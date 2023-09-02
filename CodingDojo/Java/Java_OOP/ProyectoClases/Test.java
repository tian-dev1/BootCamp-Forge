public class Test {
    public static void main(String[] args) {
        Project project = new Project("Udemy", "Only Online courses", 10);
        System.out.println(project.elevatorPitch());

        Project project2 = new Project();
        project2.setProjectName("Coding Dojo");
        project2.setProjectDescription("Onsite and Online courses");
        project2.setProjectCost(3000);
        System.out.println(project2.elevatorPitch());
    }
}
