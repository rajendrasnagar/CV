/**
 * @description       : You are given a dictionary of words and a large input string. 
*                       You have to find out whether the input string can be completely segmented into the words of a given dictionary.
 * @author            : rajendra_singh.nagar@syngenta.com
 * @last modified on  : 06-05-2021
 * @last modified by  : rajendra_singh.nagar@syngenta.com
 * Modifications Log 
 * Ver   Date         Author                              Modification
 * 1.0   05-30-2021   rajendra_singh.nagar@syngenta.com   Initial Version
**/
public inherited sharing class Google_StrSegmentation {
    /**
     * * Approach: 1
     * * Brute force using indexOf
     * * Time Complexity: O(n)
     * 1. Iterate over the list of words given.
     * 2. Check the word in the String and use OOB replace method to replace the word with 'word + space'. 
     * 3. Do this in the original stream only.
     */
    public String doStringSegmentation(String stream, List<String> dictionary){
        // use flag to check existance of value
        Boolean exists=true;
        // loop to iterate over the dictionary
        for(String str: dictionary){
            if(stream.indexOf(str)!= -1){
                stream = stream.replaceAll(str, str+' ');
            }else{
                exists = false;
                // break the loop
                break;
            }
        }
        if(!exists){
            return '-1';
        }else{
            return stream.trim();
        }
    }

    /**
     * * Approach: 2 - Using recursive approach
     *  n = length of input string
        for i = 0 to n - 1
        first_word = substring (input string from index [0, i] )
        second_word = substring (input string from index [i + 1, n - 1] )
        if dictionary has first_word, then look for second word via recurrsive call
            if second_word is in dictionary OR second_word is of zero length, then return true
        recursively call this method with second_word as input and return true if it can-not be segmented further.
     * * Time Complexity: O(2^n)
     */
    public List<String> segmentedValues = new List<String>();
    public Boolean doStringSegmentationRecurrsive(String stream, List<String> dictionary){
        Integer size = stream.length();
        
        if(size==0){
            return true;
        }

        for(Integer i=1; i<= size; i++){
            // If dictionary contains the word, then pass remaining word in recursive function
            if(dictionary.contains(stream.substring(0,i)) && doStringSegmentationRecurrsive(stream.substring(i,size), dictionary)){
                // add segmented values in list
                segmentedValues.add(stream.substring(0,i));
                return true;
            }
        }

        return false;
    }
    /**
    Google_StrSegmentation g = new Google_StrSegmentation();
    System.debug('***'+g.doStringSegmentationRecurrsive('applepen', new List<String>{'apple', 'pen'}));
    System.debug('***segmentedValues: '+g.segmentedValues);
    // reverse the list
    if(g.segmentedValues.size()>0){
        System.debug('***segmentedValues: '+g.segmentedValues.size());
        List<String> tempList = g.segmentedValues.clone();
        System.debug('***segmentedValues: '+g.segmentedValues.size());
        // reverse the list
        for(Integer i = g.segmentedValues.size(); i > 0; i--){
            System.debug('***tempList[i-1]: '+tempList[i-1]);
            g.segmentedValues[g.segmentedValues.size()-i]=tempList[i-1];
        }
    }
    System.debug('***segmentedValues: '+g.segmentedValues);
    */
}