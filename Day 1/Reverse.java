import java.util.Stack;

public class Reverse {
    public static void main(String[] args) {

        String s = "my name is asha";
        Stack<Character> st = new Stack<>();
        String result = "";

        for (int i = 0; i < s.length(); i++) {

            char ch = s.charAt(i);

            if (ch != ' ') {
                st.push(ch);
            } 
            else {
                while (st.size() > 0) {
                    result = result + st.pop();
                }
                result = result + " ";
            }
        }

        while (st.size() > 0) {
            result = result + st.pop();
        }

        System.out.println(result);
    }
}

