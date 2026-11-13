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
 
    // Add node at last
    void addAtLast(int data) {
 
        Node ptr = new Node(data);
 
        if (head == null) {
            head = ptr;
        }
        else {
            Node temp = head;
 
            while (temp.next != null) {
                temp = temp.next;
            }
            
            
            
 
            temp.next = ptr;
        }
    }
     void addAtBeginning(int data){
        
        Node ptr = new Node(data);
        if(head == null){
            head = ptr;
        }
        else{
            ptr.next = head;
            head = ptr;
        }
    }

    void addAtPosition(int data,int pos){
    Node ptr = new Node(data);
 
    Node temp = head;
    int i = 0;
    while(temp.next != null){
        if(i == pos - 1){
            ptr.next = temp.next;
            temp.next = ptr;
            return;
        }
        temp = temp.next;
        i++;
    }
    }  

    void deleteAtEnd() {

    if (head == null) {
        System.out.println("List is Empty");
        return;
    }

    if (head.next == null) {
        head = null;
        return;
    }

    Node temp = head;
    Node save = null;

    while (temp.next != null) {
        save = temp;
        temp = temp.next;
    }

    save.next = null;
    }

    void deleteAtPosition(int pos) {

    if (head == null) {
        System.out.println("List is Empty");
        return;
    }

    if (pos == 0) {
        head = head.next;
        return;
    }

    Node temp = head;
    Node save = null;
    int i = 0;

    while (temp != null) {

        if (i == pos) {
            save.next = temp.next;
            return;
        }

        save = temp;
        temp = temp.next;
        i++;
    }

    }

    void deleteAtBeginning() {

    if (head == null) {
        System.out.println("List is Empty");
        return;
    }

    Node temp = head;

    head = head.next;

    temp.next = null;
    }

    void showMiddleNode() {

    if (head == null) {
        System.out.println("List is Empty");
        return;
    }

    Node slow = head;
    Node fast = head;

    while (fast != null && fast.next != null) {

        slow = slow.next;
        fast = fast.next.next;
    }

    System.out.println("Middle Node: " + slow.data);
    }
 
    // Display linked list
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
 
        list.addAtLast(10);
        list.addAtLast(20);
        list.addAtLast(30);
        list.addAtLast(40);
        list.addAtBeginning(5);
        list.addAtPosition(15, 2);
        list.deleteAtEnd();
        list.deleteAtPosition(3);
        list.deleteAtBeginning();

        list.show();
        list.showMiddleNode();
    }
}
 