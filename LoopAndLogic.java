import java.util.*;
public class LoopAndLogic {
    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        int n = sc.nextInt(); 
        
        System.out.println("For Loop (1 to " + n + "):");
        for (int i = 1; i <= n; i++) {
            System.out.print(i + " ");
        }
        System.out.println("\n");
        
        System.out.println("While Loop (1 to " + n + "):");
        int i = 1;
        while (i <= n) {
            System.out.print(i + " ");
            i++;
        }
        System.out.println("\n");
        sc.close();
    }
}