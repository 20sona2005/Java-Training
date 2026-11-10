
import java.util.Arrays;

public class RefundCalculation {

    static int greedy(int amount, int[] denominations) {
        int count = 0;

        System.out.print("Greedy Combination: ");

        for (int coin : denominations) {
            int number = amount / coin;

            if (number > 0) {
                System.out.print(coin + " x " + number + "  ");
                count += number;
                amount %= coin;
            }
        }

        if (amount != 0) {
            System.out.println("\nExact refund cannot be formed.");
            return -1;
        }

        System.out.println();
        return count;
    }

    static int dynamicProgramming(int amount, int[] denominations) {
        int[] dp = new int[amount + 1];
        int[] chosenCoin = new int[amount + 1];

        Arrays.fill(dp, amount + 1);
        dp[0] = 0;

        for (int i = 1; i <= amount; i++) {
            for (int coin : denominations) {
                if (coin <= i && dp[i - coin] + 1 < dp[i]) {
                    dp[i] = dp[i - coin] + 1;
                    chosenCoin[i] = coin;
                }
            }
        }

        if (dp[amount] > amount) {
            System.out.println("Exact refund cannot be formed.");
            return -1;
        }

        System.out.print("DP Combination: ");

        int remaining = amount;

        while (remaining > 0) {
            int coin = chosenCoin[remaining];
            System.out.print(coin + " ");
            remaining -= coin;
        }

        System.out.println();
        return dp[amount];
    }

    public static void main(String[] args) {

        int[] indianDenominations = {500, 200, 100, 50, 20, 10, 5, 2, 1};
        int refundAmount = 786;

        System.out.println("===== NORMAL REFUND USING GREEDY =====");
        System.out.println("Refund Amount: " + refundAmount);

        int greedyCount = greedy(refundAmount, indianDenominations);
        System.out.println("Minimum Notes/Coins: " + greedyCount);

        System.out.println("\n===== NORMAL REFUND USING DP =====");

        int dpCount = dynamicProgramming(refundAmount, indianDenominations);
        System.out.println("Minimum Notes/Coins: " + dpCount);

        System.out.println("\n===== CASE WHERE GREEDY FAILS =====");

        int[] customDenominations = {4, 3, 1};
        int amount = 6;

        System.out.println("Refund Amount: " + amount);
        System.out.println("Denominations: [4, 3, 1]");

        int greedyResult = greedy(amount, customDenominations);
        System.out.println("Greedy Notes/Coins: " + greedyResult);

        System.out.println("\n===== SOLUTION USING DYNAMIC PROGRAMMING =====");

        int dpResult = dynamicProgramming(amount, customDenominations);
        System.out.println("DP Minimum Notes/Coins: " + dpResult);

        System.out.println("\n===== COMPLEXITY =====");
        System.out.println("Greedy Time: O(d)");
        System.out.println("Greedy Space: O(1)");
        System.out.println("DP Time: O(amount * d)");
        System.out.println("DP Space: O(amount)");
    }
}
