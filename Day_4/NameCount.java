package Day_4;

import java.util.*;

public class NameCount {

    public static void main(String[] args) {

        String names[] = {
            "Amit", "Ravi", "Amit",
            "Neha", "Ravi", "Amit"
        };

        HashMap<String, Integer> map = new HashMap<>();

        for (int i = 0; i < names.length; i++) {

            if (map.containsKey(names[i])) {
                map.put(names[i], map.get(names[i]) + 1);
            }
            else {
                map.put(names[i], 1);
            }
        }

        for (String name : names) {
            if (map.containsKey(name)) {
                System.out.println(name + " = " + map.get(name));
                map.remove(name);
            }
        }
    }
}