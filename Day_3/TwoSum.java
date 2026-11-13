package Day_3;


public class TwoSum {
    public static void main(String[] args) {

        int[] a = {5, 20, 30, 40, 50};
        int target = 60;

        int L = 0;
        int R = a.length - 1;

        while (L < R) {

            int sum = a[L] + a[R];

            if (sum == target) {
                System.out.println(a[L] + " + " + a[R] + " = " + target);
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

