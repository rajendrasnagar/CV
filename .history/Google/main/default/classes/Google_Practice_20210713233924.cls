/**
 * @description       : Practice class
 * @author            : rajendra_singh.nagar@syngenta.com
 * @last modified on  : 07-13-2021
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 * Modifications Log 
 * Ver   Date         Author                              Modification
 * 1.0   06-07-2021   rajendra_singh.nagar@syngenta.com   Initial Version
**/

// Iterate over the stream  of numbers and mark 1st presence and last presence of the number. It will be linear iteration & hence complexity would be n.

// Create two methods to find minimum & maximum index of the value using binary search. Complexity would be logn.

// 1 2 2 2 3

public inherited sharing Class Google_Practice{
    
    public class Node{
        public Integer data;
        public Node left, right;
        public Node(Integer data){
            this.data = data;
            left = right = null;
        }
    }

    /* 
    #1 Diameter of binary tree
    1. It would be max of left diameter, right diameter and sum of left & right height.
     */
    public static Integer getDiameter(Node nod){
        if(nod == null){
            return 0;
        }

        // Get left & right height 
        Integer lh = height(nod.left);
        Integer rh = height(nod.right);

        // Get left & right diameter
        Integer ld = getDiameter(nod.left);
        Integer rd = getDiameter(nod.right);

        return Math.max(lh+rh+1, Math.max(ld, rd));
    }

    private static Integer height(Node nod){
        if(nod == null){
            return 0;
        }

        // get further left & right height
        Integer lh = height(nod.left);
        Integer rh = height(nod.right);

        return Math.max(lh, rh)+1;
    }
}