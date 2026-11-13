package Day_3;

public class Palindrome {
    public static void main(String[] args) {

        String s = "MADAM";

        int L = 0;
        int R = s.length() - 1;

        boolean flag = true;

        while (L < R) {

            if (s.charAt(L) != s.charAt(R)) {
                flag = false;
                break;
            }

            L++;
            R--;
        }

        if (flag) {
            System.out.println("Palindrome");
        }
        else {
            System.out.println("Not Palindrome");
        }
    }
}

