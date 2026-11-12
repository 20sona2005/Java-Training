
import java.util.*;
import java.util.ArrayList;
import java.util.LinkedList;

public class MicroserviceGraph {

    int vertices;
    ArrayList<ArrayList<Integer>> adj;

    MicroserviceGraph(int v) {
        vertices = v;
        adj = new ArrayList<>();

        for (int i = 0; i < v; i++) {
            adj.add(new ArrayList<>());
        }
    }

    // Add dependency
    void addEdge(int source, int destination) {
        adj.get(source).add(destination);
    }

    // BFS Traversal
    void BFS(int start) {

        boolean visited[] = new boolean[vertices];

        Queue<Integer> queue = new LinkedList<>();

        visited[start] = true;
        queue.add(start);

        System.out.print("BFS Traversal: ");

        while (!queue.isEmpty()) {

            int current = queue.poll();

            System.out.print(current + " ");

            for (int neighbor : adj.get(current)) {

                if (!visited[neighbor]) {

                    visited[neighbor] = true;
                    queue.add(neighbor);
                }
            }
        }

        System.out.println();
    }

    // DFS Traversal
    void DFS(int start) {

        boolean visited[] = new boolean[vertices];

        System.out.print("DFS Traversal: ");

        dfsHelper(start, visited);

        System.out.println();
    }

    void dfsHelper(int vertex, boolean visited[]) {

        visited[vertex] = true;

        System.out.print(vertex + " ");

        for (int neighbor : adj.get(vertex)) {

            if (!visited[neighbor]) {
                dfsHelper(neighbor, visited);
            }
        }
    }

    // Cycle Detection
    boolean hasCycle() {

        boolean visited[] = new boolean[vertices];
        boolean recStack[] = new boolean[vertices];

        for (int i = 0; i < vertices; i++) {

            if (!visited[i]) {

                if (detectCycle(i, visited, recStack)) {
                    return true;
                }
            }
        }

        return false;
    }

    boolean detectCycle(int vertex, boolean visited[], boolean recStack[]) {

        visited[vertex] = true;
        recStack[vertex] = true;

        for (int neighbor : adj.get(vertex)) {

            if (!visited[neighbor]) {

                if (detectCycle(neighbor, visited, recStack)) {
                    return true;
                }

            } else if (recStack[neighbor]) {

                return true;
            }
        }

        recStack[vertex] = false;

        return false;
    }

    public static void main(String[] args) {

        MicroserviceGraph graph = new MicroserviceGraph(6);


        graph.addEdge(0, 1);
        graph.addEdge(0, 2);
        graph.addEdge(1, 3);
        graph.addEdge(1, 4);
        graph.addEdge(2, 4);
        graph.addEdge(3, 5);
        graph.addEdge(4, 5);

        System.out.println("MICROSERVICE DEPENDENCY GRAPH");

        System.out.println("0 - User Service");
        System.out.println("1 - Product Service");
        System.out.println("2 - Order Service");
        System.out.println("3 - Payment Service");
        System.out.println("4 - Inventory Service");
        System.out.println("5 - Notification Service");

        System.out.println();

        graph.BFS(0);

        graph.DFS(0);

        System.out.println();

        if (graph.hasCycle()) {
            System.out.println("Cycle Detected in the Graph");
        } else {
            System.out.println("No Cycle Detected in the Graph");
        }

        // Add an edge to demonstrate cycle detection
        graph.addEdge(5, 0);

        System.out.println("\nAfter Adding Dependency 5 -> 0:");

        if (graph.hasCycle()) {
            System.out.println("Cycle Detected in the Graph");
        } else {
            System.out.println("No Cycle Detected in the Graph");
        }
    }
}
