
import java.io.*;
import java.util.*;

public class OrderSorting {

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
            System.out.printf(
                "%d | %d | %.2f | %s%n",
                orderId, customerId, amount, createdAt
            );
        }
    }

    static Order[] loadOrders(String filename)
            throws IOException {

        List<Order> list = new ArrayList<>();

        try (BufferedReader br =
                new BufferedReader(new FileReader(filename))) {

            String line;
            br.readLine();

            while ((line = br.readLine()) != null) {

                String[] data = line.split(",");

                list.add(new Order(
                    Integer.parseInt(data[0]),
                    Integer.parseInt(data[1]),
                    Double.parseDouble(data[2]),
                    data[3]
                ));
            }
        }

        return list.toArray(new Order[0]);
    }

    static void bubbleSort(Order[] orders, boolean trace) {

        int n = orders.length;

        for (int i = 0; i < n - 1; i++) {

            for (int j = 0; j < n - i - 1; j++) {

                if (orders[j].amount < orders[j + 1].amount) {

                    Order temp = orders[j];
                    orders[j] = orders[j + 1];
                    orders[j + 1] = temp;
                }
            }

            if (trace && i < 3) {
                System.out.println("\nAfter Pass " + (i + 1) + ":");
                displayFirstFive(orders);
            }
        }
    }

    static void mergeSort(Order[] orders) {

        if (orders.length <= 1) {
            return;
        }

        int mid = orders.length / 2;

        Order[] left = Arrays.copyOfRange(orders, 0, mid);
        Order[] right = Arrays.copyOfRange(
            orders, mid, orders.length
        );

        mergeSort(left);
        mergeSort(right);

        merge(orders, left, right);
    }

    static void merge(Order[] orders,
                      Order[] left,
                      Order[] right) {

        int i = 0, j = 0, k = 0;

        while (i < left.length && j < right.length) {

            if (left[i].amount >= right[j].amount) {
                orders[k++] = left[i++];
            } else {
                orders[k++] = right[j++];
            }
        }

        while (i < left.length) {
            orders[k++] = left[i++];
        }

        while (j < right.length) {
            orders[k++] = right[j++];
        }
    }

    static void displayFirstFive(Order[] orders) {

        for (int i = 0; i < Math.min(5, orders.length); i++) {
            orders[i].display();
        }
    }

    static void traceFirstThreePasses() {

        double[] values = {450, 1200, 850, 2500, 700};

        System.out.println("\n===== BUBBLE SORT PASS TRACING =====");

        System.out.println("Original: " +
                Arrays.toString(values));

        for (int i = 0; i < 3; i++) {

            for (int j = 0; j < values.length - i - 1; j++) {

                if (values[j] < values[j + 1]) {

                    double temp = values[j];
                    values[j] = values[j + 1];
                    values[j + 1] = temp;
                }
            }

            System.out.println("Pass " + (i + 1) + ": " +
                    Arrays.toString(values));
        }
    }

    static boolean verifyResults(Order[] a, Order[] b) {

        if (a.length != b.length) {
            return false;
        }

        for (int i = 0; i < a.length; i++) {

            if (Double.compare(a[i].amount, b[i].amount) != 0) {
                return false;
            }
        }

        return true;
    }

    public static void main(String[] args) {

        try {

            Order[] allOrders = loadOrders("orders.csv");

            int size = 10000;

            Order[] original =
                Arrays.copyOf(allOrders, size);

            Order[] bubbleData = original.clone();
            Order[] mergeData = original.clone();
            Order[] builtInData = original.clone();

            System.out.println("Total CSV Records: "
                    + allOrders.length);

            System.out.println("Records Used for Sorting: "
                    + size);

            traceFirstThreePasses();

            System.out.println("\n===== BUBBLE SORT =====");

            long start1 = System.nanoTime();

            bubbleSort(bubbleData, false);

            long end1 = System.nanoTime();

            System.out.printf("Execution Time: %.3f ms%n",
                    (end1 - start1) / 1_000_000.0);

            System.out.println("\n===== MERGE SORT =====");

            long start2 = System.nanoTime();

            mergeSort(mergeData);

            long end2 = System.nanoTime();

            System.out.printf("Execution Time: %.3f ms%n",
                    (end2 - start2) / 1_000_000.0);

            System.out.println("\n===== JAVA BUILT-IN SORT =====");

            long start3 = System.nanoTime();

            Arrays.sort(
                builtInData,
                (a, b) -> Double.compare(b.amount, a.amount)
            );

            long end3 = System.nanoTime();

            System.out.printf("Execution Time: %.3f ms%n",
                    (end3 - start3) / 1_000_000.0);

            System.out.println("\n===== SORTED ORDERS =====");

            displayFirstFive(bubbleData);

            boolean sameResults =
                verifyResults(bubbleData, mergeData)
                && verifyResults(bubbleData, builtInData);

            System.out.println("\nAll three sorting results match: "
                    + sameResults);

            System.out.println("\n===== COMPLEXITY =====");

            System.out.println("Bubble Sort: O(n^2)");
            System.out.println("Merge Sort: O(n log n)");
            System.out.println("Built-in Object Sort: O(n log n)");

            System.out.println("Bubble Sort Space: O(1)");
            System.out.println("Merge Sort Space: O(n)");
            System.out.println("Built-in Object Sort Space: O(n)");

        } catch (IOException e) {

            System.out.println("Error: " + e.getMessage());

        }
    }
}
