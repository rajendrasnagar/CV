/**
 * @description       : Practice class
 * @author            : rajendra_singh.nagar@syngenta.com
 * @last modified on  : 07-12-2021
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 * Modifications Log 
 * Ver   Date         Author                              Modification
 * 1.0   06-07-2021   rajendra_singh.nagar@syngenta.com   Initial Version
**/

// Iterate over the stream  of numbers and mark 1st presence and last presence of the number. It will be linear iteration & hence complexity would be n.

// Create two methods to find minimum & maximum index of the value using binary search. Complexity would be logn.

// 1 2 2 2 3

public inherited sharing Class Google_Practice{
    public static Integer findMinIndex(List<Integer> stream, Integer x){
        Integer low = 0, high = stream.size()-1, mid=0;
        while(low < high){
            mid = low + (high - low)/2;
            if(x <= stream[mid]){
                high = mid - 1;
            }else{
                low = mid + 1;
            }
        }
        if(low < stream.size() && stream[low] == x){
            return low;
        }

        return -1;
    }

    public static Integer findMaxIndex(List<Integer> stream, Integer x){
        Integer low = 0, high = stream.size()-1, mid=0;
        while(low < high){
            mid = low + (high - low)/2;
            if(x < stream[mid]){
                high = mid - 1;
            }else{
                low = mid + 1;
            }
        }
        if(high > 0 && stream[high] == x){
            return high;
        }

        return -1;
    }
}