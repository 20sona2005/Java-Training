
import java.util.*;
import java.util.LinkedList;

public class MicroserviceGraph {

    ArrayList<ArrayList<Integer>> graph = new ArrayList<>();
    String[] services = {
        "Pricing", "Inventory", "Cart",
        "Payment", "Notification"
    };

    MicroserviceGraph() {
        for (int i = 0; i < services.length; i++) {
            graph.add(new ArrayList<>());
        }
    }

    // Add dependency
    void addEdge(int from, int to) {
        graph.get(from).add(to);
    }

    // BFS Traversal
    void BFS(int start) {

        boolean visited[] = new boolean[services.length];
        Queue<Integer> q = new LinkedList<>();

        visited[start] = true;
        q.add(start);

        System.out.print("BFS: ");

        while (!q.isEmpty()) {

            int current = q.poll();

            System.out.print(services[current] + " ");

            for (int next : graph.get(current)) {
                if (!visited[next]) {
                    visited[next] = true;
                    q.add(next);
                }
            }
        }

        System.out.println();
    }

    // DFS Traversal
    void DFS(int start, boolean visited[]) {

        visited[start] = true;
        System.out.print(services[start] + " ");

        for (int next : graph.get(start)) {
            if (!visited[next]) {
                DFS(next, visited);
            }
        }
    }

    // Topological Sort and Cycle Detection
    void deploymentOrder() {

        int indegree[] = new int[services.length];

        for (int i = 0; i < services.length; i++) {
            for (int next : graph.get(i)) {
                indegree[next]++;
            }
        }

        Queue<Integer> q = new LinkedList<>();

        for (int i = 0; i < services.length; i++) {
            if (indegree[i] == 0) {
                q.add(i);
            }
        }

        int count = 0;

        System.out.print("Deployment Order: ");

        while (!q.isEmpty()) {

            int current = q.poll();

            System.out.print(services[current] + " ");
            count++;

            for (int next : graph.get(current)) {

                indegree[next]--;

                if (indegree[next] == 0) {
                    q.add(next);
                }
            }
        }

        if (count != services.length) {
            System.out.println("\nCycle Detected!");
        } else {
            System.out.println("\nNo Cycle Detected!");
        }
    }

    public static void main(String[] args) {

        MicroserviceGraph g = new MicroserviceGraph();

        // Adding dependencies
        g.addEdge(0, 2); // Pricing -> Cart
        g.addEdge(1, 2); // Inventory -> Cart
        g.addEdge(2, 3); // Cart -> Payment
        g.addEdge(3, 4); // Payment -> Notification

        System.out.println("MICROSERVICE DEPENDENCY GRAPH");

        g.BFS(0);

        System.out.print("DFS: ");
        g.DFS(0, new boolean[5]);

        System.out.println("\n");

        // Valid deployment order
        g.deploymentOrder();

        // Adding circular dependency
        g.addEdge(4, 0);

        System.out.println("\nAfter adding Notification -> Pricing:");

        g.deploymentOrder();
    }
}
