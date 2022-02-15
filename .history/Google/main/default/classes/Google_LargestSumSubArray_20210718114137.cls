/**
 * @description       : 
 * @author            : rajendra_singh.nagar@syngenta.com
 * @last modified on  : 07-18-2021
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 * Modifications Log 
 * Ver   Date         Author                              Modification
 * 1.0   05-31-2021   rajendra_singh.nagar@syngenta.com   Initial Version
**/
public inherited sharing class Google_LargestSumSubArray {
    /**
     * 1. Create a map with single key/value pair to represent largest sum. Key will store the sum & value will be a list stores sub-array. 
     * 2. Populate the map with first value from the array, considering this as maximum.
     * 3. Iterate over the input stream and sum the values starting with index 0 using nested for loop.
     * 4. Inner for loop is used to sum ith to stream size. So, inner loop variable starts from ith+1.
     * 5. Compare the calculated sum with each inner loop iteration, with the one stored in Map. 
     *    If sum is greater, replace the sub-array and sum in Map, otherwise break the loop.
     * 6. In the last, return the map's value. Note, there will be only one entry for map.
     */
    public Map<Integer, List<Integer>> getLargestSubArray(List<Integer> stream){
        // Map to store highest value and value set
        Map<Integer, List<Integer>> highMap = new Map<Integer, List<Integer>>();

        // Store first val in the map
        highMap.put(stream[0], new List<Integer>{stream[0]});
        // Logic to check the highest value
        for(Integer i=0; i < stream.size(); i++){
            // get the ith value
            Integer ith = stream[i];
            // store the ith value in the List
            List<Integer> inList = new List<Integer>{ith};
            // Store the intermediate sum
            Integer iSum = ith;
            for(Integer j=i+1; j < stream.size(); j++){
                Integer jth = stream[j];
                // Summation of previous values
                iSum += jth;
                // check the previous val
                Integer interVal = new List<Integer>(highMap.keySet())[0];
                if(interVal < iSum){
                    // add qualified value to list
                    inList.add(jth);
                    // add to existing map
                    highMap.put(iSum, inList);
                    // delete 
                    highMap.remove(interVal);
                }else{
                    break;
                    // Check for other continous sequence
                }
                System.debug('***high:in:'+highMap);
            }
            System.debug('***high:'+highMap);
        }

        return highMap;
    }

    // ! With Kodane's algorithm, I can't get the list of subarray that build the largest sum.
    public Integer getLargestSubArrayKadane(List<Integer> stream){
        Integer currMax = stream[0];
        Integer globalMax = stream[0];
        for(Integer i = 1; i < stream.length(); i++){
            if(currMax<0){
                currMax = stream[i];
            }else{
                currMax += stream[i];
            }

            if(globalMax < currMax){
                globalMax = currMax;
            }
        }
        return globalMax;
    }
}