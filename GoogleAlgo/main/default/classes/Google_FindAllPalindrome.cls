/**
 * @description       : 
 * @author            : rajendra_singh.nagar@syngenta.com
 * @last modified on  : 06-03-2021
 * @last modified by  : rajendra_singh.nagar@syngenta.com
 * Modifications Log 
 * Ver   Date         Author                              Modification
 * 1.0   05-30-2021   rajendra_singh.nagar@syngenta.com   Initial Version
**/
public with sharing class Google_FindAllPalindrome {
    /**
     * * Approach #: 1 - Check around characters.
     * 1. Use loop to iterate over the stream.
     * 2. While iterating over each character, look for palindromes on both side using inner loops.
     * 3. There will be two inner loops. Both loops will check whether characters on both sides are same or not. If not same, break loop.
     * 4. One loop will check odd palindromes & other will check even palindromes.
     * 5. For odd palindromes, use two variables (let say j,k) where j=i and k=i. 
     * 6. If value at j & k are same, decrement j & increment k. Check again.
     * 7. For even palindromes, use two variables (let say j,k) where j=i & k=i+1.
     * 8. If value at j & k are same, decrement j & increment k. Check again.
     * ! Time Complexity: O(n^2)
     */
    public Integer findAllPalindrome(String stream){
        // get the size 
        Integer n = stream.length();
        // If there are no, Or only one letter in string
        if(n==0 || n==1){
            return n;
        }

        Integer count = 0;
        for(Integer i=0; i<n; i++){
            Integer j = i, k = i;
            
            // odd 
            while(j >= 0 && k < n && stream.substring(j, j+1) == stream.substring(k, k+1)){
                System.debug('***odd');
                j--;
                k++;
                count++;
            }

            // even
            j = i; k = i+1;
            while(j >= 0 && k < n && stream.substring(j, j+1) == stream.substring(k, k+1)){
                System.debug('***even');
                j--;
                k++;
                count++;
            }

        }
        return count;
    }
}
/*
Google_FindAllPalindrome g = new Google_FindAllPalindrome();
System.debug('***'+g.findAllPalindrome('aabbaa'));
*/