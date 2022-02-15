/**
 * @description       : Find the two non-repeating elements in an array of repeating elements
 * @author            : rajendra_singh.nagar@syngenta.com
 * @last modified on  : 06-12-2021
 * @last modified by  : rajendra_singh.nagar@syngenta.com
 * Modifications Log 
 * Ver   Date         Author                              Modification
 * 1.0   06-11-2021   rajendra_singh.nagar@syngenta.com   Initial Version
**/
public inherited sharing class Google_NonRepeatingElements {
    /**
     * * Approach #1 - Using lists & iteration
     * ! Complexity: O(n)
     * 1. Create two list, one to store unique elements & other to store duplicate elements.
     * 2. Keep first element in the unique list.
     * 3. Iterate over passed stream & check for the element being processed. 
     * 4. If it is contained in the unique set, remove it from unique list & add to duplicate list.
     * 5. If it is not contained in the unique set, add it.
     * 6. Repeat the iteration process.
     */
    public List<Integer> findNonRepeatative(List<Integer> stream){
        // Create 2 lists 
        List<Integer> uniqueElements = new List<Integer>{stream[0]};
        List<Integer> duplicateElements = new List<Integer>();

        // Iterate over the stream & process duplicate elements
        Integer size = stream.size();
        for(Integer i=1; i<size; i++){
            // check for duplicate elements
            Integer uniqueIndex = uniqueElements.indexOf(stream[i]);
            if(uniqueIndex!=-1){
                // move to duplicate list
                duplicateElements.add(uniqueElements[uniqueIndex]);
                // remove from unique list
                uniqueElements.remove(uniqueIndex);
            }else{
                // add to unique elements
                uniqueElements.add(stream[i]);
            }
        }

        // return the unique set
        return uniqueElements;

    }

    /**
     * * Approach #2: Using XOR
     * 1. Do XOR of all the elements. The value returned by XOR operation is XOR of those 2 non-repeating values.
     * 2. To break those 2 values divide the given set into two parts using RSB(right most set bit).
     * 3. XOR first set to get first unique value. Similarly, do XOR to get second unique value.
     */
    public List<Integer> findUniquevaluesXOR(List<Integer> stream){
        // variable to contain XOR values
        Integer xorValue = 0;
        // do xor of all values
        for(Integer rec: stream){
            xorValue ^= rec;
        }

        // get rsb (right most set bit)
        Integer rsb = xorValue & -xorValue;

        // divide in set, xor'ing values in set
        Integer i = 0, j = 0;
        for(Integer rec: stream){
            if((rec & rsb) == 0){
                i ^=rec;
            }else{
                j ^=rec;
            }
        }
        return new List<Integer>{i, j};
    }
}