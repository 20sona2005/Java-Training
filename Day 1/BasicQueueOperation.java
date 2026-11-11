import java.util.LinkedList;
import java.util.Queue;

class BasicQueueOperation {
    public static void main(String[] args) {

        int a[] = {3,4,5,6,7,8,9,4,5,6,7,8};

        Queue<Integer> q = new LinkedList<>();

        for(int i = 0; i < a.length; i++) {
            q.offer(a[i]);
        }

        int temp = q.poll();

        q.offer(temp);

        while(q.size() > 0) {
            System.out.print(q.poll() + " ");
        }
    }
}
