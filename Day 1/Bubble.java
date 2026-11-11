import java.util.*;

public class Bubble {

    public static void main(String args[]) {

        Scanner sc = new Scanner(System.in);

        int a[] = new int[100];
        int temp;

        System.out.println("Enter the size");
        int n = sc.nextInt();

        System.out.println("Enter the array elements");

        for (int i = 0; i < n; i++) {
            a[i] = sc.nextInt();
        }

        for (int i = 0; i < n - 1; i++) {

            for (int j = 0; j < n - i - 1; j++) {

                if (a[j] > a[j + 1]) {

                    temp = a[j];
                    a[j] = a[j + 1];
                    a[j + 1] = temp;
                }
            }
        }

        System.out.println("Sorted array:");

        for (int i = 0; i < n; i++) {
            System.out.print(a[i] + " ");
        }

        sc.close();
    }
}