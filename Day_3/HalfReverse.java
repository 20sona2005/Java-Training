package Day_3;
public class HalfReverse {
    public static void main(String[] args) {

        int[] a = {5, 6, 3, 4, 1, 2, 7, 8};

        int i, j, temp;

        for (i = 0, j = (a.length / 2) - 1; i < j; i++, j--) {
            temp = a[i];
            a[i] = a[j];
            a[j] = temp;
        }

        for (int x : a) {
            System.out.print(x + " ");
        }
    }
}
