class staticmultipleobj {
    int id;
    String name;
    double monthlySalary;
    static String companyName = "TechCorp";

    staticmultipleobj (int id, String name, double monthlySalary) {
        this.id = id;
        this.name = name;
        this.monthlySalary = monthlySalary;
    }

    double calculateAnnualSalary() {
        return monthlySalary * 12;
    }

    void displayEmployeeDetails() {
        System.out.println(id + " " + name + " " + companyName + 
                           " Annual Salary: " + calculateAnnualSalary());
    }

    public static void main(String[] args) {
        staticmultipleobj e1 = new staticmultipleobj(101, "John", 30000);
        staticmultipleobj e2 = new staticmultipleobj(102, "Sara", 40000);

        e1.displayEmployeeDetails();
        e2.displayEmployeeDetails();
    }
}
