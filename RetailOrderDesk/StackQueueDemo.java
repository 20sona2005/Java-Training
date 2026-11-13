
package RetailOrderDesk;

class MyStack {

    int[] stack = new int[5];
    int top = -1;

    // Push operation
    void push(int value) {

        if (top == stack.length - 1) {
            System.out.println("Stack is full");
        } else {
            top++;
            stack[top] = value;
            System.out.println("Added to stack: " + value);
        }
    }

    // Pop operation
    int pop() {

        if (top == -1) {
            System.out.println("Stack is empty");
            return -1;
        }

        return stack[top--];
    }

    // Display operation
    void display() {

        System.out.print("Stack contents: ");

        for (int i = top; i >= 0; i--) {
            System.out.print(stack[i] + " ");
        }

        System.out.println();
    }
}


class MyQueue {

    int[] queue = new int[5];
    int front = 0;
    int rear = -1;

    // Enqueue operation
    void enqueue(int value) {

        if (rear == queue.length - 1) {
            System.out.println("Queue is full");
        } else {
            rear++;
            queue[rear] = value;
            System.out.println("Added to queue: " + value);
        }
    }

    // Dequeue operation
    int dequeue() {

        if (front > rear) {
            System.out.println("Queue is empty");
            return -1;
        }

        return queue[front++];
    }

    // Display operation
    void display() {

        System.out.print("Queue contents: ");

        for (int i = front; i <= rear; i++) {
            System.out.print(queue[i] + " ");
        }

        System.out.println();
    }
}


public class StackQueueDemo {

    public static void main(String[] args) {

        System.out.println("===== NORMAL STACK USING ARRAY =====");

        MyStack stack = new MyStack();

        stack.push(1001);
        stack.push(1002);
        stack.push(1003);

        stack.display();

        System.out.println("Undo operation: " + stack.pop());

        stack.display();


        System.out.println("\n===== NORMAL QUEUE USING ARRAY =====");

        MyQueue queue = new MyQueue();

        queue.enqueue(2001);
        queue.enqueue(2002);
        queue.enqueue(2003);

        queue.display();

        System.out.println("Processing order: " + queue.dequeue());

        queue.display();


        System.out.println("\n===== COMPLEXITY =====");

        System.out.println("Stack Push: O(1)");
        System.out.println("Stack Pop: O(1)");
        System.out.println("Queue Enqueue: O(1)");
        System.out.println("Queue Dequeue: O(1)");
        System.out.println("Stack Space: O(n)");
        System.out.println("Queue Space: O(n)");
    }
}
