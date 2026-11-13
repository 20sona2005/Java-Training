
package RetailOrderDesk;

import java.util.Arrays;

public class RefundCalculation {

    public static void main(String[] args) {

        int[] coins = {4, 3, 1};
        int amount = 6;

        // GREEDY METHOD
        System.out.println("GREEDY METHOD");

        int remaining = amount;
        int count = 0;

        for (int coin : coins) {

            while (remaining >= coin) {

                remaining = remaining - coin;
                count++;

                System.out.print(coin + " ");
            }
        }

        System.out.println("\nGreedy Total Coins: " + count);


        // DYNAMIC PROGRAMMING
        System.out.println("\nDYNAMIC PROGRAMMING");

        int[] dp = new int[amount + 1];
        int[] chosenCoin = new int[amount + 1];

        Arrays.fill(dp, 999);
        dp[0] = 0;

        for (int i = 1; i <= amount; i++) {

            for (int coin : coins) {

                if (coin <= i &&
                    dp[i - coin] + 1 < dp[i]) {

                    dp[i] = dp[i - coin] + 1;
                    chosenCoin[i] = coin;
                }
            }
        }

        // DISPLAY DP COINS
        System.out.print("DP Selected Coins: ");

        remaining = amount;

        while (remaining > 0) {

            int coin = chosenCoin[remaining];

            System.out.print(coin + " ");

            remaining = remaining - coin;
        }

        System.out.println();

        System.out.println("DP Minimum Coins: " + dp[amount]);


        // COMPLEXITY
        System.out.println("\nCOMPLEXITY");

        System.out.println("Greedy Time: O(d)");
        System.out.println("Greedy Space: O(1)");

        System.out.println("DP Time: O(amount * d)");
        System.out.println("DP Space: O(amount)");
    }
}

