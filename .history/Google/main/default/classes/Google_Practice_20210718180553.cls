/**
 * @description       : Practice class
 * @author            : rajendra_singh.nagar@syngenta.com
 * @last modified on  : 07-18-2021
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 * Modifications Log 
 * Ver   Date         Author                              Modification
 * 1.0   06-07-2021   rajendra_singh.nagar@syngenta.com   Initial Version
**/

// Iterate over the stream  of numbers and mark 1st presence and last presence of the number. It will be linear iteration & hence complexity would be n.

// Create two methods to find minimum & maximum index of the value using binary search. Complexity would be logn.

// 1 2 2 2 3

public inherited sharing Class Google_Practice{
    
    // Print all sub-array with sum 0
    public static List<Integer> printAllSubArrayWithSum0(List<Integer> stream){
        Integer sumSoFar = 0, size = stream.size();
        Map<Integer, List<Integer>> sumIndexMap = new Map<Integer, List<Integer>>();
        for(Integer i ; i < size; i++){
            sumSoFar += stream[i];
            if(sumIndexMap.containsKey(sumSoFar)){
                List<Integer> indexList = sumIndexMap.get(sumSoFar);
                indexList.add(i);
                sumIndexMap.put(sumSoFar,  indexList);
            }else{
                sumIndexMap.put(sumSoFar, new List<Integer>{i});
            }
        }
        System.debug('***sumIndexMap:'+sumIndexMap);
    }
    
}