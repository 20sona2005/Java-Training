
public class SlidingWindowTraffic {

    public static void main(String[] args) {

        // Hourly visitor counts
        int visitors[] = {
            120, 150, 180, 200, 250,
            300, 280, 350, 400, 320,
            250, 200, 180, 150, 100
        };

        int windowSize = 3;

        // Calculate first window sum
        int sum = 0;

        for (int i = 0; i < windowSize; i++) {
            sum += visitors[i];
        }

        int maxSum = sum;
        int maxIndex = 0;

        // Sliding Window
        for (int i = windowSize; i < visitors.length; i++) {

            sum = sum + visitors[i] - visitors[i - windowSize];

            if (sum > maxSum) {
                maxSum = sum;
                maxIndex = i - windowSize + 1;
            }
        }

        System.out.println("HOURLY TRAFFIC ANALYSIS");

        System.out.println("\nVisitor Counts:");

        for (int i = 0; i < visitors.length; i++) {
            System.out.println("Hour " + (i + 1) + ": " + visitors[i]);
        }

        System.out.println("\nBUSIEST 3-HOUR PERIOD");

        System.out.println("Starting Hour: " + (maxIndex + 1));

        System.out.println("Ending Hour: " + (maxIndex + windowSize));

        System.out.println("Maximum Visitors: " + maxSum);

        System.out.print("Visitors in Busiest Period: ");

        for (int i = maxIndex; i < maxIndex + windowSize; i++) {
            System.out.print(visitors[i] + " ");
        }

        System.out.println();
    }
}
