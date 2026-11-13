package Day_4;

class Node {
    int data;
    Node next;

    Node(int info) {
        data = info;
        next = null;
    }
}

class LinkedList {

    Node head = null;

    
    void addAtBeginning(int data) {

        Node ptr = new Node(data);

        if (head == null) {
            head = ptr;
        } else {
            ptr.next = head;
            head = ptr;
        }
    }

    
    void addAtLast(int data) {

        Node ptr = new Node(data);

        if (head == null) {
            head = ptr;
        } else {
            Node temp = head;

            while (temp.next != null) {
                temp = temp.next;
            }

            temp.next = ptr;
        }
    }

    
    void deleteByValue(int value) {

        if (head == null) {
            System.out.println("List is Empty");
            return;
        }

        // If first node contains the value
        if (head.data == value) {
            head = head.next;
            return;
        }

        Node temp = head;

        while (temp.next != null) {

            if (temp.next.data == value) {
                temp.next = temp.next.next;
                return;
            }

            temp = temp.next;
        }

        System.out.println("Value not found");
    }

    
    void show() {

        Node temp = head;

        while (temp != null) {
            System.out.print(temp.data + " -> ");
            temp = temp.next;
        }

        System.out.println("null");
    }
}

public class LinkedListDemo {

    public static void main(String[] args) {

        LinkedList list = new LinkedList();

        list.addAtBeginning(10);
        list.addAtLast(20);
        list.addAtLast(30);
        list.addAtLast(40);

        System.out.println("Before Deletion:");
        list.show();

        list.deleteByValue(20);

        System.out.println("After Deletion:");
        list.show();
    }
}