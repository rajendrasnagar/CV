/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @last modified on  : 07-21-2021
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 * Modifications Log 
 * Ver   Date         Author                               Modification
 * 1.0   07-20-2021   ChangeMeIn@UserSettingsUnder.SFDoc   Initial Version
**/
public inherited sharing class Google_sortNumbers {
    /**
     * * Approach #1: Using Dutch National Flag Algorithm
     * 1. Use three variables - low, mid & high.
     * 2. Use iteration so that mid < high.
     * 3. If mid is 0, swap with low & increment both by 1.
     * 4. If mid is 1, increment m by 1.
     * 5. If mid is 2, swap with high & decrement high by 1.
     */
    public List<Integer> sortNumber(List<Integer> stream){
        Integer low=0, mid=0, high = stream.size()-1;
        while(mid <= high){
            Integer inVar;
            switch on mid{
                when 0 {
                    // swap with low
                    inVar = stream[low];
                    stream[low] = stream[mid];
                    stream[mid] = inVar;

                    // increment
                    low++;
                    mid++;
                    break;
                }
                when 1 {
                    // do nothing, just increment
                    mid++;
                    break;
                }

                when 2 {
                    // swap with high
                    inVar = stream[mid];
                    stream[mid] = stream[high];
                    stream[high] = inVar;

                    // decrement
                    high--;
                    break;
                }
            }
        }
        return stream;
    }
}
