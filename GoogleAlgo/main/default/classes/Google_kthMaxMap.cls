/**
 * * Using max heap
 * - Create a new array & start pushing values in it. 
 * - Whenever a value is added invoke heapifyUp(). 
 *  -> Get parent node of new value added to new array.
 *  -> Compare parent value with the value being added. If parent value is < value, swap them. 
 *    -> If swapped, get parents parent & re-run above logic.
 *  ** Above will create max heap
 * - For addition, add the value in new array & re-run above logic.
 * - To get kth largest element, poll() k values from heap.
 *  -> Replace root node with last element & run heapifyDown()
 *   -> Start with root (index=0) and run below logic untill we have left index.
 *    -> Compare left & right nodes. If any node is > parent, swap them.
 *    -> Start the logic again with index set as swapped child index.
 *   -> Return root Element which will be new maximum element.
 * ! Complexity: 
 * * Heap Preparation: nlogn
 * * Additon: logn
 */
public class Google_kthMaxMap {
    private List<Integer> harr; // pointer to array of elements in heap
    private List<Integer> newarr = new List<Integer>();
    private Integer size=0; // Current number of elements in min heap
    
    // getting different indexes
    private Integer parent(Integer i) { return (i - 1) / 2; }
    private Integer left(Integer i) { return ((2 * i )+ 1); }
    private Integer right(Integer i) { return ((2 * i) + 2); }
    
    // helper methods 
    public Integer getMax() { return newarr[0]; } // Returns minimum
    
    // Time Complexity: O(n * logn)
    public Google_kthMaxMap(List<Integer> a){
        // instantiate original array
        harr = a;
        
        // iterate over the array and heapify values
        for(Integer val: a){
            newarr.add(harr[size]);
            size++;
            heapifyUp();
        }
    }
    
    /* This is bottom up process - We start with size which is array size and goes up checking parent*/
    private void heapifyUp(){
        Integer index=size-1;
        // get the left & right nodes
        Integer p = parent(index);
        System.debug('***Node:p:'+p);
        System.debug('***index:p:'+index);
        // Other already inserted node should already be sorted.
        while (p>=0 && newarr[p] < newarr[index]){
            // swap the values
            System.debug('***swap:');
            Integer t = newarr[index];
            newarr[index] = newarr[p];
            newarr[p] = t; 
            index = p;
            p = parent(p);
        }
    }
    
    // Time Complexity : O( Log n)
    public Integer addItem(Integer item){
        System.debug('***addItem:1:'+size);
        // add in original array
        harr.add(item);
        System.debug('***addItem:2:'+harr[size]);
        newarr.add(harr[size]);
        size++;
        heapifyUp();
        
        // return the value at root
        return getMax();
    }
    
    // Time Complexity : O(Logn)
    public void poll(){
        if(size == 0){
            // throw exception
            throw new Google_kthMaxHeapException();
        }
        
        // remove the top element & add element from bottom
        size = --size;
        newarr[0]=newarr[size];
        heapifydown();
    }

    /* This is top down process which starts with index=0 and compares both child nodes */
    private void heapifydown(){
        Integer index=0;
        while(left(index)<size){
            // Mark left as big child
            Integer bigChildIndex=left(index);
            // Check right for big child, & if right is bigger, set its index as big child
            if(right(index)<size && newarr[right(index)] > newarr[bigChildIndex]){
                bigChildIndex=right(index);
            }
            if(newarr[index] < newarr[bigChildIndex]){
                //swap 
               	Integer t = newarr[index];
                newarr[index] = newarr[bigChildIndex];
                newarr[bigChildIndex] = t; 
            }else{
                // No action
                break;
            }
            index = bigChildIndex;
        }
    }
    
    public class Google_kthMaxHeapException extends Exception{}
} 
/*
Google_kthMaxMap gh = new Google_kthMaxMap(
    new List<Integer>{7,6,5,4,3,2,10,19,20}
);
System.debug(gh);
//System.debug(Google_kthv2.kthSmallest(new List<Integer>{7,6,5,4,3,2}, 6, 2));
gh.poll();
System.debug('***after poll:'+gh);
*/