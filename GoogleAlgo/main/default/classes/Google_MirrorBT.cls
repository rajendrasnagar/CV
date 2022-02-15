/**
 * @description       : Program to convert Binary Tree to its Mirror
 * @author            : rajendra_singh.nagar@syngenta.com
 * @last modified on  : 06-05-2021
 * @last modified by  : rajendra_singh.nagar@syngenta.com
 * Modifications Log 
 * Ver   Date         Author                              Modification
 * 1.0   05-30-2021   rajendra_singh.nagar@syngenta.com   Initial Version
**/
public inherited sharing class Google_MirrorBT {
    /**
     * Class to represent a Node
     */
    Class Node{
        Integer data;
        Node left, right;
        public Node(Integer data){
            this.data = data;
            left = right = null;
        }
    }

    Class BinaryTree{
        Node root;

        // * Mirror the Tree values
        public void mirror(){
            root = mirror(root);
        }
        private Node mirror(Node node){
            if(node==NULL){
                return  node;
            }

            // invoke mirror recurrsively for left node
            Node left = mirror(node.left);
            // invoke mirror recurrsively for right node
            Node right = mirror(node.right);

            // * Swap the values
            node.left = right;
            node.right = left;

            return node;
        }

        // * Method for in order traversal
        public void inOrder(){
            inOrder(root);
        }
        // * Function to print sorted order of Binary Tree
        private void inOrder(Node node){
            if(node==NULL){
                return;
            }
            // recursively check the left node
            inOrder(node.left);
            // once done, print node data - Will be same for left & right sub-trees
            System.debug(node.data);

            // After printing left data, check recurrsively for right data
            inOrder(node.right);
        }
    }

    /**
     * * Mirror the binary tree
     */
    public void mirrorBT(){
        // * Creating a binary tree and entering its node
        BinaryTree bt = new BinaryTree();
        bt.root = new Node(1);
        bt.root.left = new Node(2);
        bt.root.right = new Node(3);
        bt.root.left.left = new Node(4);
        bt.root.left.right = new Node(5);

        // * Print the Binary tree
        bt.inOrder();

        // * Mirror the tree
        bt.mirror();

        // * Print the mirrored tree
        bt.inOrder();
    }
    
}
/* 
Google_MirrorBT bt = new Google_MirrorBT();
bt.mirrorBT();
 */