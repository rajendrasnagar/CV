/**
 * @description       : Practice class
 * @author            : rajendra_singh.nagar@syngenta.com
 * @last modified on  : 07-20-2021
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 * Modifications Log 
 * Ver   Date         Author                              Modification
 * 1.0   06-07-2021   rajendra_singh.nagar@syngenta.com   Initial Version
**/

// Iterate over the stream  of numbers and mark 1st presence and last presence of the number. It will be linear iteration & hence complexity would be n.

// Create two methods to find minimum & maximum index of the value using binary search. Complexity would be logn.

// 1 2 2 2 3

public inherited sharing Class Google_Practice{
    
    public static List<Integer> findLowHigh(List<Integer> stream, Integer x){
        List<Integer> returnValue = new List<Integer>{-1, -1};
        // Check if passed element doesn't exists in the list
        if(x < stream[0] || x > stream[stream.size()-1]){
            return returnValue;
        }

        returnValue[0] = findLow(stream, x);
        returnValue[1] = findHigh(stream, x);

        return returnValue;
    }

    // 1,2,3,3,3,3,5
    // Find low and high index
    private static Integer findLow(List<Integer> stream, Integer x){
        Integer low = 0, high = stream.size()-1, mid = 0;

        while (low <= high){
            mid = low + (high-low)/2;

            // move towards lower index
            if(stream[mid] >= x){
                high = mid - 1;
            }else{
                low = mid + 1;
            }
        }

        // low should contain the value & should be greater than 0
        return low;
    }
    
    private static Integer findHigh(List<Integer> stream, Integer x){
        Integer low = 0, high = stream.size()-1, mid = 0;

        while (low <= high){
            mid = low + (high-low)/2;

            // move towards higher index
            if(stream[mid] > x){
                high = mid - 1;
            }else{
                low = mid + 1;
            }
        }
        // low should contain the value & should be less than stream size
        return high;
    }
}