import java.util.*;
import java.util.LinkedList;

public class SKUHashTable {

    // Custom Hash Table using Chaining
    static class HashTable {

        LinkedList<String>[] table;
        int size;

        HashTable(int size) {
            this.size = size;
            table = new LinkedList[size];

            for (int i = 0; i < size; i++) {
                table[i] = new LinkedList<>();
            }
        }

        // Hash Function
        int hash(String sku) {
            return Math.floorMod(sku.hashCode(), size);
        }

        // Insert
        void insert(String sku) {
            int index = hash(sku);
            table[index].add(sku);
        }

        // Search
        boolean search(String sku) {
            int index = hash(sku);
            return table[index].contains(sku);
        }

        // Display
        void display() {
            for (int i = 0; i < size; i++) {
                if (!table[i].isEmpty()) {
                    System.out.println("Index " + i + ": " + table[i]);
                }
            }
        }
    }

    public static void main(String[] args) {

        // 1. Custom Hash Table
        HashTable ht = new HashTable(5);

        ht.insert("SKU1");
        ht.insert("SKU6");
        ht.insert("SKU2");
        ht.insert("SKU3");

        System.out.println("CUSTOM HASH TABLE");
        ht.display();

        // 2. Collision Demonstration
        System.out.println("\nCOLLISION DEMONSTRATION");

        System.out.println("SKU1 Index: " + ht.hash("SKU1"));
        System.out.println("SKU6 Index: " + ht.hash("SKU6"));

        System.out.println("SKU1 and SKU6 have same index.");

        // 3. Built-in HashMap
        HashMap<String, String> map = new HashMap<>();

        int total = 100000;

        for (int i = 1; i <= total; i++) {
            map.put("SKU" + i, "Product" + i);
        }

        System.out.println("\nBUILT-IN HASHMAP");
        System.out.println("Total SKUs: " + map.size());
        System.out.println("Search SKU50000: " + map.get("SKU50000"));

        // 4. Custom Hash Table with 100000 SKUs
        HashTable custom = new HashTable(200003);

        for (int i = 1; i <= total; i++) {
            custom.insert("SKU" + i);
        }

        // 5. Lookup Time Comparison
        String key = "SKU50000";
        int repeat = 100000;

        long start1 = System.nanoTime();

        for (int i = 0; i < repeat; i++) {
            custom.search(key);
        }

        long end1 = System.nanoTime();

        long start2 = System.nanoTime();

        for (int i = 0; i < repeat; i++) {
            map.get(key);
        }

        long end2 = System.nanoTime();

        System.out.println("\nLOOKUP TIME COMPARISON");

        System.out.println("Custom Hash Table: " +
                (end1 - start1) / 1000000.0 + " ms");

        System.out.println("Built-in HashMap: " +
                (end2 - start2) / 1000000.0 + " ms");
    }
}
