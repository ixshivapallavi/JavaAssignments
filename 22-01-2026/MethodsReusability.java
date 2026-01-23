class MethodsReusability {

    static int add(int a, int b) {
        return a + b;
    }

    static boolean isEven(int number) {
        return number % 2 == 0;
    }

    static int findFactorial(int number) {
        int fact = 1;
        for (int i = 1; i <= number; i++) {
            fact *= i;
        }
        return fact;
    }

    public static void main(String[] args) {
        System.out.println(add(5, 3));
        System.out.println(isEven(4));
        System.out.println(findFactorial(5));
    }
}
