import java.util.Stack;

public class ReverseStack {
    public static void main(String args[]) {

        int a[] = {3, 4, 5, 6, 7, 8, 9, 4, 5, 6, 7, 8};

        Stack<Integer> stack = new Stack<>();

        for (int i = 0; i < a.length; i++) {
            stack.push(a[i]);
        }

        for (int i = 0; i < a.length; i++) {
            a[i] = stack.pop();
        }

        for (int i = 0; i < a.length; i++) {
            System.out.print(a[i] + " ");
        }
    }
}
