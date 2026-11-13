package Day_4;

public class EqualTarget {
     public static void main(String[] args) {

        int[] a = {2,4,6,8,10,12};
        int target = 14;

        int L = 0;
        int R = a.length - 1;

        while (L < R) {

            int sum = a[L] + a[R];

            if (sum == target) {
                System.out.println("Pair found: " + a[L] + " , " + a[R] );
                break;
            }
            else if (sum > target) {
                R--;
            }
            else {
                L++;
            }
        }
    }
}
