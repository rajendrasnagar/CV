/**
 * @description       : Find all triplets with sum as zero.
 * @author            : rajendra_singh.nagar@syngenta.com
 * @last modified on  : 07-18-2021
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 * Modifications Log 
 * Ver   Date         Author                              Modification
 * 1.0   06-10-2021   rajendra_singh.nagar@syngenta.com   Initial Version
**/
public inherited sharing class Google_TripletsWithZero {
    /**
     * * Approach #1: 
     * ! Complexity: O(n^2)
     * 1. Sort the array. Need to do this as we can have identical elements as well.
     * 2. Use two iterations. For each element in the iteration, subtract it with the element of inner iteration.
     * 3. Check the substracted value in the array using index of.
     * 4. Add all 3 indices in a set for skipping. Also, add the found element in list to be returned.
     * ! We are using set to store indices instead of reusing list, as the element can be repeatative.
     * 6. Continue the same logic for other elements.
     */
    public List<List<Integer>> getTriplets(List<Integer> stream){
        List<List<Integer>> result = new List<List<Integer>>();
        Set<Integer> skipSet = new Set<Integer>();
        // Outer iteration
        Integer size = stream.size();
        for(Integer i=0; i< size; i++){
            // iterate only if it is not present in skip set
            if(!skipSet.contains(i)){
                // Inner iteration to iterate over the remaining values
                for(Integer j=i+1; j < size; j++){
                    if(!skipSet.contains(j)){ // to skip inner counter part indices
                        Integer counterPart = -1*(stream[i] + stream[j]);
                        System.debug('***counterPart:'+counterPart);
                        Integer counterIndex = stream.indexOf(counterPart);
                        System.debug('***counterIndex:'+counterIndex);
                        // Check the existance of counter part
                        if(counterIndex!=-1){
                            // if exist, append it in the result list & skip set
                            result.add(new List<Integer>{stream[i], stream[j], counterPart});
                            skipSet.addAll(new Set<Integer>{i, j, counterIndex});
                        }
                    }
                }
            }
            System.debug('***skipSet:'+skipSet);
        }
        // return the result
        return result;
    }
}