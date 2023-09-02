public class Project {
    private String name;
	private String description;
	private double initialCost;
	private float cost;
	
	public Project() {}
	
	public Project(String name) {
		this.name = name;
	}
	
	public Project(String name, String description) {
		this.name = name;
		this.description = description;
	}

	public Project(String name, String description, double initialCost){
        this.name = name;
        this.description = description;
        this.initialCost = initialCost;
        this.cost = (float) initialCost;
    }
	
	public String getProjectName() {
		return this.name;
	}
	public String setProjectName(String name) {
		return this.name = name;
	}

	public String getProjectDescription() {
		return this.description;
	}
	public String setProjectDescription(String description) {
		return this.description = description;
	}

	public float getProjectCost() {
		return this.cost;
	}
	public float setProjectCost(float cost) {
		return this.cost = cost;
	}
	
	public String elevatorPitch() {
		return this.name + " ($" + this.cost + "): " + this.description;
	}
}
