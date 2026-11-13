package Day_4;

import java.util.*;

public class HalfReverse {
    public static void main(String[] args) {

        int a[] = {1, 2, 3, 4, 5, 6};

        Queue<Integer> q = new LinkedList<>();

       
        for (int i = 0; i < a.length; i++) {
            q.add(a[i]);
        }

        
        int half = a.length / 2;

        for (int i = 0; i < half; i++) {
            int value = q.remove();
            q.add(value);
        }

        System.out.println(q);
    }
}