/**
 * @description       : Different solutions for tree related problems
 * @author            : rajendra_singh.nagar@syngenta.com
 * @last modified on  : 06-19-2021
 * @last modified by  : rajendra_singh.nagar@syngenta.com
 * Modifications Log 
 * Ver   Date         Author                              Modification
 * 1.0   06-19-2021   rajendra_singh.nagar@syngenta.com   Initial Version
**/
public inherited sharing class Google_TreeSolutions {
    private class TreeNode{
        Integer data;
        TreeNode left, right;
        TreeNode(Integer data){
            this.data = data;
            this.left = this.right = null;
        }
    }

    public Integer maxDepth(TreeNode root) {
        if(root==null){
            return 0;
        }
        
        Integer left = maxDepth(root.left);
        Integer right = maxDepth(root.right);
        Integer depth = Math.max(left, right);
        return depth+1;
    }

    public Integer minDepth(TreeNode root) {
        // Corner case. Should never be hit unless the code is
        // called on root = NULL
        if (root == null)
            return 0;
 
        // Base case : Leaf Node. This accounts for height = 1.
        if (root.left == null && root.right == null)
            return 1;
 
        // If left subtree is NULL, recur for right subtree
        if (root.left == null)
            return minDepth(root.right) + 1;
 
        // If right subtree is NULL, recur for left subtree
        if (root.right == null)
            return minDepth(root.left) + 1;
 
        return Math.min(minDepth(root.left),
                        minDepth(root.right)) + 1;
    }
}