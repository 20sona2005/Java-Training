package Day_4;

import java.util.*;
import java.util.LinkedList;

public class QueueRotation {
    public static void main(String[] args) {

        int a[] = {1, 2, 3, 4, 5};

        Queue<Integer> q = new LinkedList<>();

        
        for (int i = 0; i < a.length; i++) {
            q.add(a[i]);
        }

        
        int value = q.remove();

        
        q.add(value);

        System.out.println(q);
    }
}