class Student {
    private int id;
    private String name;
    private int marks;

    Student(int id, String name, int marks) {
        this.id = id;
        this.name = name;
        this.marks = marks;
    }

    int getId() {
        return id;
    }

    String getName() {
        return name;
    }

    int getMarks() {
        return marks;
    }

    
    void setId(int id) {
        this.id = id;
    }

    void setName(String name) {
        this.name = name;
    }

    void setMarks(int marks) {
        this.marks = marks;
    }

    void display() {
        System.out.println(getId() + " " + getName() + " " + getMarks());
    }
}

public class ClassObject {

    public static void main(String[] args) {
        Student s1 = new Student(1, "Amit", 75);
        Student s2 = new Student(2, "Ravi", 35);

        s1.display();
        s2.display();
    }
}
