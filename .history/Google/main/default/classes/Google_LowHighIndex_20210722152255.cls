/**
 * @description       : 
 * @author            : rajendra_singh.nagar@syngenta.com
 * @last modified on  : 07-22-2021
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 * Modifications Log 
 * Ver   Date         Author                              Modification
 * 1.0   06-07-2021   rajendra_singh.nagar@syngenta.com   Initial Version
**/

public inherited sharing class Google_LowHighIndex {
    private List<Integer> stream;
    private Integer num;
    // method to find low index - Use Binary Search
    public static Integer findHighIndex(List<Integer> stream, Integer x){
        Integer low = 0, high = stream.size() -1, mid;

        while (low <= high){
            mid = low + (high - low)/2;
            
            if(stream[mid] > x){
                high = mid - 1;
            }else{
                low  = mid + 1;
            }
        }

        // Check if the element is present at high index or not
        if(high > 0 && stream[high]==x){
            return high;
        }

        return -1;
    }

    /* 1,2,3,3,3,4
    l=0,h=5,m=2
    l=0,h=1,m=0
    l=1,h=1,m=0
    l=2 */
    // method to find high index - Use Binary Search
    public static Integer findLowIndex(List<Integer> stream, Integer x){

        Integer low = 0, high = stream.size()-1, mid;
        
        while (low <= high){
            mid = low + (high-low)/2;
            if(stream[mid] >= x){
                high = mid -1;
            }else{
                low = mid + 1;
            }
            System.debug('***low:'+low);
            System.debug('***high:'+high);
            System.debug('***mid:'+mid);
        }

        // Check if the element is present at low index or not
        if(low < stream.size() && stream[low] == x){
            return low;
        }

        return -1;
    }
}