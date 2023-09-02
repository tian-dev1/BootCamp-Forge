import java.util.ArrayList;

public class Portfolio {
    private ArrayList<Project> projects = new ArrayList<>();
    public Portfolio(){};

    public void addProject(Project project){
        this.projects.add(project);
    }
    
    public ArrayList<Project> getProjects(){
        return this.projects;
    }
    
    public float getPortfolioCost(){
       float sum = 0.0f;
       for(int i = 0; i < this.projects.size(); i++){
           sum += this.projects.get(i).getProjectCost();
       }
       return sum;
   }
   
   public void showPortfolio(){
       System.out.println("PORTFOLIO CONTENTS");
       for(int i = 0; i < this.projects.size(); i++){
           System.out.println(this.projects.get(i).elevatorPitch());
       }
       System.out.println("Total Portfolio Cost: $" + this.getPortfolioCost());
   }
}