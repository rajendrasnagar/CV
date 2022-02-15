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
    
    // get two non repeating integers in the list of integers
    /* Approach #1
    1. Use two collection, one for duplicate element & other for unique element
    2. Iterate over the stream and check the element in unique collection first. 
    3. If it exists in unique collection, remove it from unique & put it on duplicate collection.
    4. In the end, what will remain in unique collection will be non-repeating elements
    ! Time Complexity: O(n)
     */
    public static Set<Integer> getUnique(List<Integer> stream){
        List<Integer> duplicateList = new List<Integer>();
        Set<Integer> uniqueSet = new set<Integer>();

        for(Integer val: stream){
            if(uniqueSet.contains(val)){
                uniqueSet.remove(val);
                duplicateList.add(val);
            }else{
                uniqueSet.add(val);
            }
        }

        // return uniqueSet

    }
}