package RetailOrderDesk;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashSet;
import java.util.Set;

public class DuplicateDetection {

    static class Order {
        int orderId;
        int customerId;
        BigDecimal amount;
        LocalDateTime createdAt;

        Order(int orderId, int customerId, BigDecimal amount, LocalDateTime createdAt) {
            this.orderId = orderId;
            this.customerId = customerId;
            this.amount = amount;
            this.createdAt = createdAt;
        }
    }

    public static void main(String[] args) {

        Set<String> orderKeys = new HashSet<>();

        int totalOrders = 0;
        int duplicateCount = 0;

        DateTimeFormatter formatter =
                DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

        try (BufferedReader br = new BufferedReader(new FileReader("RetailOrderDesk/orders.csv"))) {

            String line;
            br.readLine();

            System.out.println("===== DUPLICATE ORDER DETECTION =====");

            while ((line = br.readLine()) != null) {

                String[] data = line.split(",");

                int orderId = Integer.parseInt(data[0]);
                int customerId = Integer.parseInt(data[1]);
                BigDecimal amount = new BigDecimal(data[2]);
                LocalDateTime createdAt =
                        LocalDateTime.parse(data[3], formatter);

                Order order = new Order(orderId, customerId, amount, createdAt);

                String key = order.customerId + "|" +
                        order.amount.stripTrailingZeros().toPlainString() + "|" +
                        order.createdAt.format(
                                DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm"));

                totalOrders++;

                if (!orderKeys.add(key)) {
                    duplicateCount++;

                    System.out.println(
                            "Duplicate Found: Order ID: " + order.orderId +
                            " | Customer ID: " + order.customerId +
                            " | Amount: " + order.amount +
                            " | Created At: " + order.createdAt);
                }
            }

            System.out.println("\n===== SUMMARY =====");
            System.out.println("Total Orders Checked: " + totalOrders);
            System.out.println("Duplicate Orders Found: " + duplicateCount);
            System.out.println("Unique Orders: " + (totalOrders - duplicateCount));

            System.out.println("\n===== COMPLEXITY =====");
            System.out.println("Time Complexity: O(n) average");
            System.out.println("Space Complexity: O(n)");

        } catch (IOException e) {
            System.out.println("Error reading CSV file: " + e.getMessage());
        }
    }
}
