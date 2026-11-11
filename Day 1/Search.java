
import java.util.*;

public class Search {

    public static int search(int a[], int val) {

        for (int i = 0; i < a.length; i++) {

            if (a[i] == val) {
                return i + 1;
            }
        }

        return -1;
    }

    public static void main(String args[]) {

        Scanner sc = new Scanner(System.in);

        int val = 29;

       
        int n = sc.nextInt();

        int a[] = new int[n];

       

        for (int i = 0; i < n; i++) {
            a[i] = sc.nextInt();
        }

        int pos = search(a, val);

        if (pos != -1) {
            System.out.println("Found");
            System.out.println("Position = " + pos);
        }
        else {
            System.out.println("Not Found");
        }

        sc.close();
    }
}