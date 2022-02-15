/**
 * @description       : Practice class
 * @author            : rajendra_singh.nagar@syngenta.com
 * @last modified on  : 07-14-2021
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

    // helper methods
    private static Integer parent(n){ return (n-1)/2;}
    private static Integer left(n){ return (2n+1);}
    private static Integer right(n){ return (2n+2);}
    public static Integer getmax(){ return minStream[0]; }

    // # kth Element using min map
    private static List<Integer> minStream = new List<Integer>();
    public static Integer getKthElement(List<Integer> stream, Integer k){
        // add into new array that will be minified
        for(Integer i=0; i < k; i++){
            minStream.add(stream[i]);
        }

        // Minify minStream
        Integer p = (k-1)/2;
        while(p < 0){
            minHeapify(p);
            p--;
        }
    }

    private static void minHeapify(Integer index){
        // get left & right elements
        Integer l = left(index), r = right(index);
        // consider left as smallest
        Integer smallest = index;
        if(l < minStream.size() && minStream[l] < minStream[smallest]){
            smallest = l;
        }
        if(r < minStream.size() && minStream[r] < minStream[l]){
            smallest = r;
        }

        if(smallest != index){
            // swap
            Integer temp = minStream[index];
            minStream[index] = minStream[smallest];
            minStream[smallest] = temp;

            // re-invoke minHeapify
            minHeapify(smallest);
        }
    }
}