
import java.util.*;

class Order {
    int orderId;
    String customerName;
    String productName;
    int quantity;
    double price;

    Order(int orderId, String customerName,
          String productName, int quantity, double price) {

        this.orderId = orderId;
        this.customerName = customerName;
        this.productName = productName;
        this.quantity = quantity;
        this.price = price;
    }

    public String toString() {
        return orderId + " " + customerName + " "
                + productName + " " + quantity + " " + price;
    }
}

public class RetailOrderDesk {

    static ArrayList<Order> orders = new ArrayList<>();
    static Scanner sc = new Scanner(System.in);

    public static void main(String[] args) {

        int choice;

        do {
            System.out.println("\n===== RETAIL ORDER DESK =====");
            System.out.println("1. Add Order");
            System.out.println("2. Display Orders");
            System.out.println("3. Remove Order");
            System.out.println("4. Update Order");
            System.out.println("5. Sort by Order ID");
            System.out.println("6. Sort by Customer Name");
            System.out.println("7. Sort by Product Name");
            System.out.println("8. Sort by Price");
            System.out.println("9. Binary Search");
            System.out.println("10. Exit");
            System.out.print("Enter Choice: ");

            choice = Integer.parseInt(sc.nextLine());

            switch (choice) {

                case 1:
                    addOrder();
                    break;

                case 2:
                    displayOrders();
                    break;

                case 3:
                    removeOrder();
                    break;

                case 4:
                    updateOrder();
                    break;

                case 5:
                    sortById();
                    break;

                case 6:
                    sortByCustomer();
                    break;

                case 7:
                    sortByProduct();
                    break;

                case 8:
                    sortByPrice();
                    break;

                case 9:
                    binarySearch();
                    break;

                case 10:
                    System.out.println("Thank You!");
                    break;

                default:
                    System.out.println("Invalid Choice!");
            }

        } while (choice != 10);
    }

    static void addOrder() {

        System.out.print("Enter Order ID: ");
        int id = Integer.parseInt(sc.nextLine());

        System.out.print("Enter Customer Name: ");
        String customer = sc.nextLine();

        System.out.print("Enter Product Name: ");
        String product = sc.nextLine();

        System.out.print("Enter Quantity: ");
        int quantity = Integer.parseInt(sc.nextLine());

        System.out.print("Enter Price: ");
        double price = Double.parseDouble(sc.nextLine());

        orders.add(new Order(id, customer, product, quantity, price));

        System.out.println("Order Added Successfully!");
    }

    static void displayOrders() {

        if (orders.isEmpty()) {
            System.out.println("No Orders Available!");
            return;
        }

        System.out.println("\nOrder ID Customer Product Quantity Price");

        for (Order o : orders) {
            System.out.println(o);
        }
    }

    static void removeOrder() {

        System.out.print("Enter Order ID to Remove: ");
        int id = Integer.parseInt(sc.nextLine());

        for (Order o : orders) {
            if (o.orderId == id) {
                orders.remove(o);
                System.out.println("Order Removed Successfully!");
                return;
            }
        }

        System.out.println("Order Not Found!");
    }

    static void updateOrder() {

        System.out.print("Enter Order ID to Update: ");
        int id = Integer.parseInt(sc.nextLine());

        for (Order o : orders) {

            if (o.orderId == id) {

                System.out.print("Enter New Customer Name: ");
                o.customerName = sc.nextLine();

                System.out.print("Enter New Product Name: ");
                o.productName = sc.nextLine();

                System.out.print("Enter New Quantity: ");
                o.quantity = Integer.parseInt(sc.nextLine());

                System.out.print("Enter New Price: ");
                o.price = Double.parseDouble(sc.nextLine());

                System.out.println("Order Updated Successfully!");
                return;
            }
        }

        System.out.println("Order Not Found!");
    }

    static void sortById() {

        Collections.sort(orders,
                Comparator.comparingInt(o -> o.orderId));

        System.out.println("Orders Sorted by Order ID!");
        displayOrders();
    }

    static void sortByCustomer() {

        Collections.sort(orders,
                Comparator.comparing(o -> o.customerName,
                        String.CASE_INSENSITIVE_ORDER));

        System.out.println("Orders Sorted by Customer Name!");
        displayOrders();
    }

    static void sortByProduct() {

        Collections.sort(orders,
                Comparator.comparing(o -> o.productName,
                        String.CASE_INSENSITIVE_ORDER));

        System.out.println("Orders Sorted by Product Name!");
        displayOrders();
    }

    static void sortByPrice() {

        Collections.sort(orders,
                Comparator.comparingDouble(o -> o.price));

        System.out.println("Orders Sorted by Price!");
        displayOrders();
    }

    static void binarySearch() {

        if (orders.isEmpty()) {
            System.out.println("No Orders Available!");
            return;
        }

        Collections.sort(orders,
                Comparator.comparingInt(o -> o.orderId));

        System.out.print("Enter Order ID to Search: ");
        int id = Integer.parseInt(sc.nextLine());

        int low = 0;
        int high = orders.size() - 1;

        while (low <= high) {

            int mid = (low + high) / 2;

            if (orders.get(mid).orderId == id) {
                System.out.println("Order Found!");
                System.out.println(orders.get(mid));
                return;
            }

            else if (orders.get(mid).orderId < id) {
                low = mid + 1;
            }

            else {
                high = mid - 1;
            }
        }

        System.out.println("Order Not Found!");
    }
}
