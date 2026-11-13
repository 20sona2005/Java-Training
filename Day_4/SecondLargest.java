package Day_4;

public class SecondLargest {
    public static void main(String[] args) {
        int[] arr = {10,45,20,80,60};
        int largest = Integer.MIN_VALUE;
        int secondLargest = Integer.MIN_VALUE;

        for (int num : arr) {
            if (num > largest) {
                secondLargest = largest;
                largest = num;
            } else if (num > secondLargest && num != largest) {
                secondLargest = num;
            }
        }

        
        System.out.println("The second largest element is: " + secondLargest);
        
    }
}
