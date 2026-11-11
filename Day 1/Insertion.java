import java.util.*;

public class Insertion {

    public static void main(String args[]) {

        Scanner sc = new Scanner(System.in);

        int a[] = new int[100];
        int temp, j;

        System.out.println("Enter the size");
        int n = sc.nextInt();

        System.out.println("Enter the array elements");

        for (int i = 0; i < n; i++) {
            a[i] = sc.nextInt();
        }

        for (int i = 1; i < n; i++) {

            temp = a[i];
            j = i;

            while (j > 0 && a[j - 1] > temp) {

                a[j] = a[j - 1];
                j--;
            }

            a[j] = temp;
        }

        System.out.println("Sorted array:");

        for (int i = 0; i < n; i++) {
            System.out.print(a[i] + " ");
        }

        sc.close();
    }
}
