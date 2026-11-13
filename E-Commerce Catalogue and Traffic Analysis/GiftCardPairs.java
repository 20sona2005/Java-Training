
import java.util.Arrays;

public class GiftCardPairs {

    public static void main(String[] args) {

        // Product prices
        int prices[] = {
            100, 200, 300, 400, 500, 600, 700, 800
        };

        // Gift card value  
        int target = 900;

        // Sort the array
        Arrays.sort(prices);

        int left = 0;
        int right = prices.length - 1;

        System.out.println("PRODUCT PRICES");

        System.out.println(Arrays.toString(prices));

        System.out.println("\nGift Card Value: " + target);

        System.out.println("\nMATCHING PRODUCT PAIRS");

        boolean found = false;

        // Two Pointers
        while (left < right) {

            int sum = prices[left] + prices[right];

            if (sum == target) {

                System.out.println(
                    prices[left] + " + " + prices[right]
                    + " = " + target
                );

                found = true;

                left++;
                right--;
            }

            else if (sum < target) {

                left++;

            }

            else {

                right--;

            }
        }

        if (!found) {
            System.out.println("No matching pairs found.");
        }
    }
}
