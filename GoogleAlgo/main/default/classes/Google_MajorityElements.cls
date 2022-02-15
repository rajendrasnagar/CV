/**
 * @description       : Majority Element in an Array
 * @author            : rajendra_singh.nagar@syngenta.com
 * @last modified on  : 07-08-2021
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 * Modifications Log 
 * Ver   Date         Author                              Modification
 * 1.0   06-01-2021   rajendra_singh.nagar@syngenta.com   Initial Version
**/
public inherited sharing class Google_MajorityElements {
    /**
     * * Approach #1: Brute Force
     * 1. Prepare a map to store the elements & their counts.
     * 2. Iterate over the stream and populate the map.
     * 2.1 Store the element as key & its occurance as count.
     * 3. At the end, Iterate over the map to get the max occurance.
     * ! Time Complexity: O(n)
     */
    public Integer majorityElements(List<Integer> stream){
        Map<Integer, Integer> occuranceMap = new Map<Integer, Integer>();
        // logic to populate occrance map
        Integer size = stream.size();
        for(Integer i=0; i< size; i++){
            if(occuranceMap.containsKey(stream[i])){
                Integer tempVal = occuranceMap.get(stream[i]);
                occuranceMap.put(stream[i], ++tempVal);
            }else{
                occuranceMap.put(stream[i], 1);
            }
        }

        // Iterate over the map to find the max value
        Integer maxValue=0, maxCountOf, mapSize = occuranceMap.keySet().size();
        List<Integer> occuranceMapKeys = new List<Integer>(occuranceMap.keySet());
        for(Integer i=0; i < mapSize; i++){
            Integer key = occuranceMapKeys[i];
            if(occuranceMap.get(key) > maxValue){
                maxValue=occuranceMap.get(key);
                maxCountOf = key;
            }
        }

        return maxCountOf;

    }
    /* Test
    System.debug('****'+g.majorityElements(new List<Integer>{3, 1, 4, 2, 2, 4, 2, 3}));
    */

    /**
     * * Approach #2: Using Moore's Algorithm
     * 1. Mark first element of list as Majority, set counter as 1, and compare all rest elements using loop.
     * 2. If the next element in iteration is same as that of majority element, increment the counter else decrement it.
     * 3. If counter == 0, reset majority element as next element & again set counter as 1.
     * 4. At the end, what remains is candidate of majority element.
     * 5. Use another for loop to check how many times, the candidate has occured in the array. 
     * 6. If the count is greater than (array size / 2), return this element else, return not found.
     * ! Time Complexity: O(n)
     */
    public Integer majorityElementsMoore(List<Integer> stream){
        // Find the candidate
        Integer candidate = stream[0], count = 1, size = stream.size();
        for(Integer i = 1; i < size; i++){
            // If candidate matches increment the counter else decrement it.
            if(candidate==stream[i]){
                count++;
            }else{
                count--;
            }
            System.debug('***stream[0]:'+stream[i]);
            System.debug('***count:'+count);
            // if count is 0, reset the candidate
            if(count==0){
                candidate=stream[i];
                count=1;
            }
        }
        System.debug('***candidate:'+candidate);

        // Check the candidate occurance count
        count=0; // rest count
        for(Integer i = 0; i < size; i++){
            if(candidate==stream[i]){
             count++;   
            }
        }
        System.debug('***count:'+count);

        // check with size / 2
        if(count > size/2){
            return candidate;
        }else{
            return -1;
        }

    }
    /* Test
    System.debug('****'+g.majorityElementsMoore(new List<Integer>{3, 3, 4, 2, 2, 4, 2, 3}));
    System.debug('****'+g.majorityElementsMoore(new List<Integer>{1, 3, 3, 3, 2}));
    */
}