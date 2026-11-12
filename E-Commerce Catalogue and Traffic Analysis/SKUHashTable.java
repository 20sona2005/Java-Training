
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.HashMap;

public class SKUHashTable {

    // Node class
    static class Node {
        String sku;
        String product;

        Node(String sku, String product) {
            this.sku = sku;
            this.product = product;
        }
    }

    // Custom Hash Table using Chaining
    static class HashTable {

        ArrayList<LinkedList<Node>> table;
        int size;

        HashTable(int size) {
            this.size = size;
            table = new ArrayList<>();

            for (int i = 0; i < size; i++) {
                table.add(new LinkedList<>());
            }
        }

        // Hash Function
        int hash(String sku) {
            return Math.floorMod(sku.hashCode(), size);
        }

        // Insert
        void insert(String sku, String product) {
            int index = hash(sku);

            table.get(index).add(new Node(sku, product));
        }

        // Search
        String search(String sku) {
            int index = hash(sku);

            for (Node node : table.get(index)) {
                if (node.sku.equals(sku)) {
                    return node.product;
                }
            }

            return null;
        }

        // Display
        void display() {
            for (int i = 0; i < size; i++) {

                if (!table.get(i).isEmpty()) {

                    System.out.print("Index " + i + ": ");

                    for (Node node : table.get(i)) {
                        System.out.print(node.sku + " -> ");
                    }

                    System.out.println("NULL");
                }
            }
        }
    }

    public static void main(String[] args) {

        // Custom Hash Table
        HashTable ht = new HashTable(5);

        ht.insert("SKU1", "Laptop");
        ht.insert("SKU6", "Mobile");
        ht.insert("SKU2", "Keyboard");
        ht.insert("SKU3", "Mouse");

        System.out.println("===== CUSTOM HASH TABLE =====");

        ht.display();

        System.out.println("\n===== COLLISION DEMONSTRATION =====");

        System.out.println("SKU1 Hash Index: " + ht.hash("SKU1"));
        System.out.println("SKU6 Hash Index: " + ht.hash("SKU6"));

        System.out.println("Search SKU1: " + ht.search("SKU1"));

        // Built-in HashMap
        HashMap<String, String> map = new HashMap<>();

        int total = 100000;

        for (int i = 1; i <= total; i++) {
            map.put("SKU" + i, "Product" + i);
        }

        System.out.println("\n===== BUILT-IN HASHMAP =====");

        System.out.println("Total SKUs inserted: " + map.size());

        System.out.println("Search SKU50000: " + map.get("SKU50000"));

        // Custom Hash Table with 100000 SKUs
        HashTable custom = new HashTable(200003);

        for (int i = 1; i <= total; i++) {
            custom.insert("SKU" + i, "Product" + i);
        }

        String searchKey = "SKU50000";
        int repetitions = 100000;

        // Warm-up
        for (int i = 0; i < 10000; i++) {
            custom.search(searchKey);
            map.get(searchKey);
        }

        // Custom Hash Table Timing
        long start1 = System.nanoTime();

        for (int i = 0; i < repetitions; i++) {
            custom.search(searchKey);
        }

        long end1 = System.nanoTime();

        // HashMap Timing
        long start2 = System.nanoTime();

        for (int i = 0; i < repetitions; i++) {
            map.get(searchKey);
        }

        long end2 = System.nanoTime();

        double customTime = (end1 - start1) / 1000000.0;
        double mapTime = (end2 - start2) / 1000000.0;

        System.out.println("\n===== LOOKUP TIME COMPARISON =====");

        System.out.println("Number of lookups: " + repetitions);

        System.out.printf("Custom Hash Table: %.3f ms%n", customTime);

        System.out.printf("Built-in HashMap: %.3f ms%n", mapTime);
    }
}
