/**
 * @description       : Given a string containing of ‘0’, ‘1’ and ‘?’ wildcard characters, 
*                       generate all binary strings that can be formed by replacing each wildcard character by ‘0’ or ‘1’. 
 * @author            : rajendra_singh.nagar@syngenta.com
 * @last modified on  : 07-18-2021
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 * Modifications Log 
 * Ver   Date         Author                              Modification
 * 1.0   06-11-2021   rajendra_singh.nagar@syngenta.com   Initial Version
**/
public inherited sharing class Google_BitPattern {
    /**
     * * Approach #1
     * ! complexity: O(2^n) where n is the number of wildcard numbers on the string.
     * https://stackoverflow.com/questions/27584117/generating-all-binary-numbers-based-on-the-pattern
     * 1. Use recurrsion to print all possible combinations.
     * 2. Create a function that accepts input Stream & Index.
     * 3. If value at passed index is '?', Add '0' at that index. Increment index by 1 and reinvoke the function.
     * 4. In next line, Replace the same index value with 1, increment the index by 1 and reinvoke.
     * 5. Repeat 3-4 for next value.
     */
    public List<String> returnStream = new List<String>();
    public void printPattern(String stream, Integer index){
        // set the exit condition for recurssion
        if(stream.length()==index){
            System.debug('***print:>'+stream);
            returnStream.add(stream);
            return;
        }
        
        // Check the passed value
        if(stream.substring(index, index+1) == '?'){
            // set 0 first
            stream = replaceChar(stream, index, '0');
            // reinvoke printPattern
            printPattern(stream, index+1);

            // set 1 next
            stream = replaceChar(stream, index, '1');
            // reinvoke printPattern
            printPattern(stream, index+1);
            
            // as strings are passed by reference, reset value at index
            // stream = replaceChar(stream, index, '?');
        }else{
            printPattern(stream, index+1);
        }
    }

    /**
     * ! We can't use String's replace method, as the character that can be replaced is either 1 or 0. And, hence it will not work.
     */
    private String replaceChar(String source, Integer index, String chartoplace){
        return source.left(index) + chartoplace+ source.right(source.length()-index-1);
    }
}