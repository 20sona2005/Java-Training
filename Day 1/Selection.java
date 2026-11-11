import java.util.*;

public class Selection {

    public static void main(String args[]) {

        Scanner sc = new Scanner(System.in);

        int a[] = new int[100];
        int temp, min, pos, c = 0;

        System.out.println("Enter the size");
        int n = sc.nextInt();

        System.out.println("Enter the array elements");

        for (int i = 0; i < n; i++) {
            a[i] = sc.nextInt();
        }

        for (int i = 0; i < n - 1; i++) {

            min = a[i];
            pos = i;

            for (int j = i + 1; j < n; j++) {

                if (a[j] < min) {
                    c++;
                    min = a[j];
                    pos = j;
                }
            }

            if (c > 0) {
                temp = a[i];
                a[i] = a[pos];
                a[pos] = temp;

                c = 0;
            }
        }

        System.out.println("Sorted array:");

        for (int i = 0; i < n; i++) {
            System.out.print(a[i] + " ");
        }

        sc.close();
    }
}
