/**
 * @description       : Find the kth largest element in a number stream
 * @author            : rajendra_singh.nagar@syngenta.com
 * @last modified on  : 06-08-2021
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 * Modifications Log 
 * Ver   Date         Author                              Modification
 * 1.0   06-04-2021   rajendra_singh.nagar@syngenta.com   Initial Version
**/
public class Google_kthMinMap {
    /*
    * Using min heap
    * - Create an array with k elements & heapify it to create min heap map.
    *   -> Use parent of last node and execute logic to check both child node.  Swap the nodes where child node is smaller.
    *   -> If swapped, reinvoke the above logic, with index of smaller child node.
    *   -> If not swapped, decrement parent and reinvoke heapify.
    * - Invoke findMin() which compare each item in remaining array. 
    *   -> If item value is greater than root node, replace it and run minHeapify() with index 0. 
    *   -> This will readjust the heap.
    * - For addition, check if the value being added is greater than root node. 
    *   -> If yes, replace it & run minHeapify() with index 0.
   */
    List<Integer> oarr;
    List<Integer> harr = new List<Integer>(); // pointer to array of elements in heap
    Integer heap_size; // Current number of elements in min heap
    
    Integer parent(Integer i) { return (i - 1) / 2; }
    Integer left(Integer i) { return ((2 * i )+ 1); }
    Integer right(Integer i) { return ((2 * i) + 2); }
    public Integer getMin() { return harr[0]; } // Returns minimum
    
    public Google_kthMinMap(List<Integer> stream, Integer k){
        // instantiate original array
        oarr = stream;
        
        // prepare heap array with k values
        for(Integer i=0; i < k; i++){
            harr.add(stream[i]);
        }
        System.debug('**harr:'+harr);  
        
        heap_size = k;
        
        /** Logic to create min heap **/
        // Time Complexity: klogk
        // get the last node parent
        Integer i = (heap_size - 1) / 2;
        System.debug('***Node:'+i);
        while (i >= 0){
            minHeapify(i);
            i--;
        }
    }
    
    // A recursive method to heapify a subtree with root at given index
    // This method assumes that the subtrees are already heapified
    // Time Complexity: logk
    void minHeapify(Integer n)
    {
        // get the left & right nodes
        Integer l = left(n);
        System.debug('***Node:l:'+l);
        Integer r = right(n);
        System.debug('***Node:r:'+r);
        
        // compare the nodes/index to check the smallest value
        Integer smallest = n;
        if (l < heap_size && harr[l] < harr[n])
            smallest = l;
        if (r < heap_size && harr[r] < harr[smallest])
            smallest = r;
        
        // swap the values
        if (smallest != n)
        {
            System.debug('***swap:');
            Integer t = harr[n];
            harr[n] = harr[smallest];
            harr[smallest] = t;
            // recursively correct/re-order the sub-tree
            minHeapify(smallest);
        }
    }
    
    /** logic for comparing remaining items in original array **/
    // Time Complexity: (n-k)logk
    public Integer findMin(){
        /* // get remaining elements from oarr using heap_size
        List<Integer> remainingList = new List<Integer>();
        for(Integer i=heap_size; i< oarr.size(); i++){
            remainingList.add(oarr[i]);
        }
        System.debug('***remaining list:'+remainingList); */
        
        // logic to check the min value in heap tree created 
        for(Integer i = heap_size; i < oarr.size(); i++){
            // adjust min heap tree, if current value is greater than root note
            if(oarr[i] > getMin()){
                // replace root node val with oarr[i]
                harr[0]=oarr[i];
                minHeapify(0);
            }
        }
        
        // return the value at root
        return getMin();
    }
    
    /** Add item if it is greater than node, and re-minify the tree **/
    // Time Complexity: logk (where k is size of sub array created with k elements)
    public Integer addItem(Integer item){
        // add in original array
        oarr.add(item);
        
        // Compare the added item with rootNode
        if(item > getMin()){
            // replace rootNode with item
            harr[0]=item;
            minHeapify(0);
        }
        
        // return the value at root
        return getMin();
    }
} 
/*
Google_kthMinMap gh = new Google_kthMinMap(
new List<Integer>{7,6,5,4,3,2,10,19,20},
4
);
System.debug(gh);
System.debug(gh.findMin());
System.debug(gh);
System.debug(gh.addItem(21));
*/