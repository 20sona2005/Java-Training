package RetailOrderDesk;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

public class OrderSearch {

    
    static class Order {
        int orderId;
        int customerId;
        double amount;
        String createdAt;

        Order(int orderId, int customerId,
              double amount, String createdAt) {

            this.orderId = orderId;
            this.customerId = customerId;
            this.amount = amount;
            this.createdAt = createdAt;
        }

        void display() {
            System.out.println("Order ID: " + orderId);
            System.out.println("Customer ID: " + customerId);
            System.out.println("Amount: " + amount);
            System.out.println("Created At: " + createdAt);
        }
    }

    
    static Order[] loadOrders(String filename)
            throws IOException {

        Order[] orders = new Order[50000];

        try (BufferedReader br =
                new BufferedReader(new FileReader(filename))) {

            String line;
            br.readLine(); // Skip header

            int index = 0;

            while ((line = br.readLine()) != null) {

                String[] data = line.split(",");

                orders[index] = new Order(
                    Integer.parseInt(data[0]),
                    Integer.parseInt(data[1]),
                    Double.parseDouble(data[2]),
                    data[3]
                );

                index++;
            }

            if (index != 50000) {
                throw new IOException(
                    "Expected 50000 records, found " + index);
            }
        }

        return orders;
    }

    
    static Order linearSearch(Order[] orders, int target) {

        for (int i = 0; i < orders.length; i++) {

            if (orders[i].orderId == target) {
                return orders[i];
            }
        }

        return null;
    }

    
    static Order binarySearch(Order[] orders, int target) {

        int low = 0;
        int high = orders.length - 1;

        while (low <= high) {

            int mid = low + (high - low) / 2;

            if (orders[mid].orderId == target) {
                return orders[mid];
            }

            else if (orders[mid].orderId < target) {
                low = mid + 1;
            }

            else {
                high = mid - 1;
            }
        }

        return null;
    }

    public static void main(String[] args) {

        try {

            
            Order[] orders = loadOrders("RetailOrderDesk/orders.csv");

            System.out.println("Total Orders Loaded: "
                    + orders.length);

            int target = 150000;

            int repetitions = 1000;

            
            for (int i = 0; i < 100; i++) {
                linearSearch(orders, target);
                binarySearch(orders, target);
            }

            
            long startLinear = System.nanoTime();

            for (int i = 0; i < repetitions; i++) {
                linearSearch(orders, target);
            }

            long endLinear = System.nanoTime();

            
            long startBinary = System.nanoTime();

            for (int i = 0; i < repetitions; i++) {
                binarySearch(orders, target);
            }

            long endBinary = System.nanoTime();

            double linearTime =
                (endLinear - startLinear) / (double) repetitions;

            double binaryTime =
                (endBinary - startBinary) / (double) repetitions;

            
            System.out.println("\nSearching Order ID: " + target);

            Order linearResult =
                linearSearch(orders, target);

            Order binaryResult =
                binarySearch(orders, target);

            System.out.println("\n--- Linear Search Result ---");

            if (linearResult != null) {
                linearResult.display();
            } else {
                System.out.println("Order Not Found");
            }

            System.out.println("\n--- Binary Search Result ---");

            if (binaryResult != null) {
                binaryResult.display();
            } else {
                System.out.println("Order Not Found");
            }

            
            System.out.println("\n--- Performance Comparison ---");

            System.out.printf(
                "Linear Search Average: %.2f ns%n",
                linearTime);

            System.out.printf(
                "Binary Search Average: %.2f ns%n",
                binaryTime);

            
            System.out.println("\n--- Complexity Analysis ---");

            System.out.println(
                "Linear Search Time: O(n)");

            System.out.println(
                "Binary Search Time: O(log n)");

            System.out.println(
                "Linear Search Space: O(1)");

            System.out.println(
                "Binary Search Space: O(1)");

        } catch (IOException e) {

            System.out.println("Error: " + e.getMessage());

        }
    }
}
