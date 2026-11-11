import java.util.*;

public class BinarySearch {

    public static void main(String args[]) {

        Scanner sc = new Scanner(System.in);

        int a[] = new int[100];
        

        System.out.println("Enter the size");
        int n = sc.nextInt();
        System.out.println("Enter the value");
        int val = sc.nextInt();

        for (int i = 0; i < n; i++) {
            a[i] = sc.nextInt();
        }

        int low = 0;
        int high = n - 1;
        boolean flag = false;

        while (low <= high) {

            int mid = (low + high) / 2;

            if (a[mid] == val) {
                flag = true;
                break;
            }
            else if (a[mid] < val) {
                low = mid + 1;
            }
            else {
                high = mid - 1;
            }
        }

        if (flag == true) {
            System.out.println("Found");
        }
        else {
            System.out.println("Not Found");
        }

        sc.close();
    }
}
