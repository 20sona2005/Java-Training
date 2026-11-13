package Day_4;
public class NegativePositive {
    public static void main(String[] args) {

        int a[] = {10, -5, 20, -8, 30, -2, 40};

        int result[] = new int[a.length];

        int k = 0;

       
        for (int i = 0; i < a.length; i++) {

            if (a[i] < 0) {
                result[k] = a[i];
                k++;
            }
        }

        
        for (int i = 0; i < a.length; i++) {

            if (a[i] > 0) {
                result[k] = a[i];
                k++;
            }
        }

        
        System.out.println("New Array:");

        for (int i = 0; i < result.length; i++) {
            System.out.print(result[i] + " ");
        }
    }
}