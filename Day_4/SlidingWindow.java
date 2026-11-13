package Day_4;

public class SlidingWindow {

    public static void main(String[] args) {

        int a[] = {2, 1, 5, 1, 3, 2};

        int k = 3;

        int sum = 0;

        for (int i = 0; i < k; i++) {
            sum = sum + a[i];
        }

        int max = sum;

        for (int i = k; i < a.length; i++) {

            sum = sum + a[i] - a[i - k];

            if (sum > max) {
                max = sum;
            }
        }

        System.out.println("Maximum Sum = " + max);
    }
}
