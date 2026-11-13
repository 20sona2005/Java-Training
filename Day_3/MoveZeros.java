package Day_3;

public class MoveZeros {
    public static void main(String[] args) {

        int[] a = {1, 2, 3, 4, 0, 5, 7, 0};

        int L = 0;

        for (int R = 0; R < a.length; R++) {

            if (a[R] != 0) {

                int temp = a[L];
                a[L] = a[R];
                a[R] = temp;

                L++;
            }
        }

        for (int x : a) {
            System.out.print(x + " ");
        }
    }
}

