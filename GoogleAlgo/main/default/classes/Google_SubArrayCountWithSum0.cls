/**
 * @description       : 
 * @author            : rajendra_singh.nagar@syngenta.com
 * @last modified on  : 07-18-2021
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 * Modifications Log 
 * Ver   Date         Author                              Modification
 * 1.0   07-03-2021   rajendra_singh.nagar@syngenta.com   Initial Version
**/
public inherited sharing class Google_SubArrayCountWithSum0 {
    /**
     * Approach #1
     * 1. Iterate over the stream to find sum of values.
     * 2. Use a map to store sum as key and list<integer> as value to store indexes.
     * 3. If at any point, sum is repeated in map, this means that sum of values between last occurance & current occurance is 0.
     * 4. Increment the count by adding occurance from the map. 
     * 5. We are adding occurance from map instead of incrementing because occurance represents the total subarray count for the occurance.
     */
    public static integer getSubArrayWithSum0(List<Integer> stream){
        integer size = stream.size();
        integer index=-1;
        integer sum = 0, count = 0;
        Map<Integer, Integer> sumCountMap = new Map<Integer, Integer>{0=>1};
        while (index < size-1){
            // increment index
            index++;
            sum +=stream[index];
            if(sumCountMap.containskey(sum)){
                // increment the count
                count += sumCountMap.get(sum);
                // increment in the map
                sumCountMap.put(sum, sumCountMap.get(sum)+1);
            }else{
                sumCountMap.put(sum, 1);
            }
        }
        return count;
    }
}