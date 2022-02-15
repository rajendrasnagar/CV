/**
 * @description       : 
 * @author            : rajendra_singh.nagar@syngenta.com
 * @last modified on  : 06-12-2021
 * @last modified by  : rajendra_singh.nagar@syngenta.com
 * Modifications Log 
 * Ver   Date         Author                              Modification
 * 1.0   06-09-2021   rajendra_singh.nagar@syngenta.com   Initial Version
**/
public inherited sharing class Google_MissingNumber {
    /**
     * * Approach #1 - Using substraction
     * ! Complexity: nlogn + n => nlogn
     * 1. Given a set of n-1 number. Use for loop to iterate from 1 to n
     * 2. Subtract every number with value from same index in passed stream.
     * 3. If number is not 0, add it to the result else continue.
     */
    public List<Integer> getMissingNumber(List<Integer> stream){
        // sort the stream - as we will substract the value on same index
        stream.sort();
        // Create a list of numbers to be returned
        List<Integer> missingNumbers = new List<Integer>();
        // iterate over the loop
        Integer size = stream.size();
        Integer i=0, j=0;
        while(i<size){
            if(stream[j]-i!=0){
                // add to the return list
                missingNumbers.add(i);
            }else{
                j++;
            }
            i++;
        }
        // return the number
        return missingNumbers;
    }

    /**
     * * Approach #2 Using XOR
     * ! Complexity: O(n)
     * 1. Use XOR operator to nullify the same values returning missing number
     */
    public Integer getMissingNumberXor(List<Integer> stream){
        Integer xor = stream[0];
        // Iterate over the stream
        Integer size = stream.size();
        for(Integer i = 1; i < size; i++){
            xor ^= stream[i];
        }

        // xor with counts
        for(Integer i = 0; i <= size; i++){
            xor ^= i;
        }

        return xor;
    }
}