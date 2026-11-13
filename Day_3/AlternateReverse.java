package Day_3;


public class AlternateReverse {
    public static void main(String[] args) {

        int[] a = {6, 5, 3, 4, 1, 2, 7, 8, 77};

        int i, j, temp;

        for (i = 0, j = 1; j < a.length; i += 2, j += 2) {
            temp = a[i];
            a[i] = a[j];
            a[j] = temp;
        }

        for (int x : a) {
            System.out.print(x + " ");
        }
    }
}

