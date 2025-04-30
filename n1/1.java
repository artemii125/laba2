import java.util.Scanner;

public class Main {
    static boolean smpl(int n) {
        if (n < 2) return false;
        for (int i = 2; i <= Math.sqrt(n); i++) {
            if (n % i == 0) return false;
        }
        return true;
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Введите число для определения разности между ним и ближайшим простым: ");
        int N = sc.nextInt();

        if (N > 2) {
            int smaller = N;
            while (!smpl(smaller)) smaller--;

            int larger = N;
            while (!smpl(larger)) larger++;

            if (N - smaller <= larger - N) {
                System.out.println("Разность: " + (N - smaller));
            } else {
                System.out.println("Разность: " + (larger - N));
            }
        }

        System.out.println("Разность: " + (N - 2));
    }
}
