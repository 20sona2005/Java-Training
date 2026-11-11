
import java.util.HashMap;

public class HashMapExample {
    public static void main(String[] args) {

        HashMap<String, Integer> cars = new HashMap<>();

        cars.put("BMW", 5000000);
        cars.put("Audi", 4500000);
        cars.put("Benz", 6000000);
        cars.put("Toyota", 3000000);

        for (String key : cars.keySet()) {

            System.out.println(key + "  " + cars.get(key));
        }
    }
}

