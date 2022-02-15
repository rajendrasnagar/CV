/**
 * @description       : Find Diameter of a tree.  Diameter is the largest path between any two end nodes.
 * @author            : rajendra_singh.nagar@syngenta.com
 * @last modified on  : 07-02-2021
 * @last modified by  : rajendra_singh.nagar@syngenta.com
 * Modifications Log 
 * Ver   Date         Author                              Modification
 * 1.0   06-05-2021   rajendra_singh.nagar@syngenta.com   Initial Version
**/
public inherited sharing class Google_TreeDiameter {
    /**
     * * Approach #1
     * ! Complexity: O(n) as we are traversing each node once.
     * 1. Iterate over the number array and pass every element (Node) to a function (let say findDiameter) which will calculate the diameter.
     * 2. Put this diamter in a variable for later comparision.
     * 3, In findDiameter, check each left & right node
     */
    public Class Node{
        Integer data;
        Node left;
        Node right;
        public Node(Integer data){
            this.data = data;
            left = right = NULL;
        }
    }
    public Class BinaryTree{
        Node root;
        public Integer diameterOfBinaryTree(Node node){
            // Check for null
            if(node == null){
                return 0;
            }
            
            // get left & right height to prepare diamter
            Integer lh = height(node.left);
            Integer rh = height(node.right);
            
            // get diameter of left & right sub-tree
            Integer ld = diameterOfBinaryTree(node.left);
            Integer rd = diameterOfBinaryTree(node.right);
            
            // compare the maximum from all three values
            return Math.max(lh+rh, Math.max(ld, rd));
        }
        
        public Integer height(Node node){
            if(node==null){
                return 0;
            }
            
            Integer lh = height(node.left);
            Integer rh = height(node.right);
            if(lh>rh) return lh+1;
            else return rh+1;
        } 
    }

    public static void checkDiameter(){
        // Create Binary Tree
        BinaryTree bt = new BinaryTree();
        bt.root = new Node(1);
        bt.root.left = new Node(2);
        // bt.root.right = new Node(3);
        // bt.root.left.left = new Node(4);
        // bt.root.left.right = new Node(5);
        // bt.root.left.right.right = new Node(5);

        // Check the diamter 
        System.debug('***Diamter is: '+bt.diameterOfBinaryTree(bt.root));
    }
}