package Day_4;
public class RemoveDuplicates {
    public static void main(String[] args) {

        int a[] = {23,45,67,2,3,4,5,5,5,6,7,8,8};

        for (int i = 0; i < a.length; i++) {

            boolean duplicate = false;

            for (int j = 0; j < i; j++) {

                if (a[i] == a[j]) {
                    duplicate = true;
                    break;
                }
            }

            if (!duplicate) {
                System.out.print(a[i] + " ");
            }
        }
    }
}