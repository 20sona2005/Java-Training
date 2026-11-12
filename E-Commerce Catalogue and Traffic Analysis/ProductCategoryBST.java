
class ProductCategoryBST {

    static class Node {
        String data;
        Node left, right;

        Node(String value) {
            data = value;
            left = right = null;
        }
    }

    Node root = null;

    // Insert category
    void insert(String value) {
        root = insertNode(root, value);
    }

    Node insertNode(Node root, String value) {

        if (root == null) {
            return new Node(value);
        }

        if (value.compareToIgnoreCase(root.data) < 0) {
            root.left = insertNode(root.left, value);
        } 
        else if (value.compareToIgnoreCase(root.data) > 0) {
            root.right = insertNode(root.right, value);
        }

        return root;
    }

    // Search category
    boolean search(Node root, String key) {

        if (root == null) {
            return false;
        }

        if (root.data.equalsIgnoreCase(key)) {
            return true;
        }

        if (key.compareToIgnoreCase(root.data) < 0) {
            return search(root.left, key);
        }

        return search(root.right, key);
    }

    // Inorder Traversal
    void inorder(Node root) {
        if (root == null) return;

        inorder(root.left);
        System.out.print(root.data + " ");
        inorder(root.right);
    }

    // Preorder Traversal
    void preorder(Node root) {
        if (root == null) return;

        System.out.print(root.data + " ");
        preorder(root.left);
        preorder(root.right);
    }

    // Postorder Traversal
    void postorder(Node root) {
        if (root == null) return;

        postorder(root.left);
        postorder(root.right);
        System.out.print(root.data + " ");
    }

    public static void main(String[] args) {

        ProductCategoryBST bst = new ProductCategoryBST();

        String categories[] = {
            "Electronics",
            "Clothing",
            "Books",
            "Home",
            "Sports",
            "Beauty",
            "Toys",
            "Grocery",
            "Furniture",
            "Footwear",
            "Jewellery",
            "Kitchen",
            "Laptops",
            "Mobile Phones",
            "Watches"
        };

        // Insert 15 categories
        for (String category : categories) {
            bst.insert(category);
        }

        System.out.println("15 Product Categories Inserted Successfully");

        // Search
        String key = "Electronics";

        if (bst.search(bst.root, key)) {
            System.out.println(key + " category found.");
        } else {
            System.out.println(key + " category not found.");
        }

        // Traversals
        System.out.print("\nInorder Traversal: ");
        bst.inorder(bst.root);

        System.out.print("\n\nPreorder Traversal: ");
        bst.preorder(bst.root);

        System.out.print("\n\nPostorder Traversal: ");
        bst.postorder(bst.root);

        System.out.println();
    }
}
