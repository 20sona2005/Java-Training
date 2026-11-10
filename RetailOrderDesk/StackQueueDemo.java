package RetailOrderDesk;

import java.util.ArrayDeque;
import java.util.Deque;
import java.util.Queue;

class MyStack {
    int[] stack = new int[5];
    int top = -1;

    void push(int value) {
        if (top == stack.length - 1) {
            System.out.println("Stack is full");
        } else {
            stack[++top] = value;
            System.out.println("Added to stack: " + value);
        }
    }

    int pop() {
        if (top == -1) {
            System.out.println("Stack is empty");
            return -1;
        }
        return stack[top--];
    }

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
    int count = 0;

    void enqueue(int value) {
        if (count == queue.length) {
            System.out.println("Queue is full");
        } else {
            rear = (rear + 1) % queue.length;
            queue[rear] = value;
            count++;
            System.out.println("Added to queue: " + value);
        }
    }

    int dequeue() {
        if (count == 0) {
            System.out.println("Queue is empty");
            return -1;
        }

        int value = queue[front];
        front = (front + 1) % queue.length;
        count--;
        return value;
    }

    void display() {
        System.out.print("Queue contents: ");
        for (int i = 0; i < count; i++) {
            System.out.print(queue[(front + i) % queue.length] + " ");
        }
        System.out.println();
    }
}

public class StackQueueDemo {

    public static void main(String[] args) {

        System.out.println("===== STACK USING ARRAY =====");

        MyStack stack = new MyStack();

        stack.push(1001);
        stack.push(1002);
        stack.push(1003);

        stack.display();

        System.out.println("Undo operation: " + stack.pop());
        stack.display();

        System.out.println("\n===== QUEUE USING ARRAY =====");

        MyQueue queue = new MyQueue();

        queue.enqueue(2001);
        queue.enqueue(2002);
        queue.enqueue(2003);

        queue.display();

        System.out.println("Processing order: " + queue.dequeue());
        queue.display();

        System.out.println("\n===== JAVA BUILT-IN STACK =====");

        Deque<Integer> builtInStack = new ArrayDeque<>();

        builtInStack.push(1001);
        builtInStack.push(1002);
        builtInStack.push(1003);

        System.out.println("Undo operation: " + builtInStack.pop());
        System.out.println("Remaining stack: " + builtInStack);

        System.out.println("\n===== JAVA BUILT-IN QUEUE =====");

        Queue<Integer> builtInQueue = new ArrayDeque<>();

        builtInQueue.offer(2001);
        builtInQueue.offer(2002);
        builtInQueue.offer(2003);

        System.out.println("Processing order: " + builtInQueue.poll());
        System.out.println("Remaining queue: " + builtInQueue);

        System.out.println("\n===== COMPLEXITY =====");
        System.out.println("Stack Push: O(1)");
        System.out.println("Stack Pop: O(1)");
        System.out.println("Queue Enqueue: O(1)");
        System.out.println("Queue Dequeue: O(1)");
        System.out.println("Stack Space: O(n)");
        System.out.println("Queue Space: O(n)");
    }
}
