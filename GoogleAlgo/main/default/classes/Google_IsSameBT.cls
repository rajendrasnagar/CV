/**
 * @description       : This Class contains methods to check if both passed binary tree are equal or not.
 * @author            : rajendra_singh.nagar@syngenta.com
 * @last modified on  : 06-08-2021
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 * Modifications Log 
 * Ver   Date         Author                              Modification
 * 1.0   05-30-2021   rajendra_singh.nagar@syngenta.com   Initial Version
**/
/**
 * ! Time Complexity: Let number of nodes in two trees be m and n then complexity of sameTree() is O(m) 
 * where m < n.
 * 1. If both trees are empty then return 1.
 * 2. Else If both trees are non -empty
     (a) Check data of the root nodes (tree1->data ==  tree2->data)
     (b) Check left subtrees recursively  i.e., call sameTree( 
          tree1->left_subtree, tree2->left_subtree)
     (c) Check right subtrees recursively  i.e., call sameTree( 
          tree1->right_subtree, tree2->right_subtree)
     (d) If a,b and c are true then return 1.
 * 3  Else return 0 (one is empty and other is not)
 */
public inherited sharing class Google_IsSameBT {
    // * A binary tree node
    private class Node{
        Integer data;
        Node left, right;
        Node(Integer data){
            this.data = data;
            left = right = NULL;
        }
    }

    // * Class to check Binary tree equivalence
    public class BinaryTree{
        Node root1, root2;

        // * Given 2 tree, returns true if both tree are structurally equivalent
        public boolean IsidenticalTrees(Node a, Node b){
            // * If both empty, return true
            if(a == NULL && b == NULL){
                return true;
            }

            // * If both are not null, check each node value recurrsively
            if(a != NULL && b != NULL){
                return (
                            a.data == b.data 
                            && IsidenticalTrees(a.left, b.left)
                            && IsidenticalTrees(a.right, b.right)
                        );
            }

            return false;
        }
    }

    // * Code to check Same Binary Tree logic
    public void checkIsSameBT(){
        // * Create both nodes
        BinaryTree bt = new BinaryTree();

        bt.root1 = new Node(1);
        bt.root1.left = new Node(2);
        bt.root1.right = new Node(3);
        bt.root1.left.left = new Node(4);
        bt.root1.left.right = new Node(5);

        bt.root2 = new Node(1);
        bt.root2.left = new Node(2);
        bt.root2.right = new Node(3);
        bt.root2.left.left = new Node(4);
        bt.root2.left.right = new Node(15);

        if(bt.IsidenticalTrees(bt.root1, bt.root2)){
            System.debug('*** Tress are identical.');
        }else{
            System.debug('*** Tress are not identical.');
        }
    }
}

/* 
Google_IsSameBT bt = new Google_IsSameBT();
bt.checkIsSameBT();
 */