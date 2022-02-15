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
    private static count=0;
    private static List<String> parenthisisList = new List<String>();
    public static void generateParenthesis(Integer x){
        count = x;
        generate('',0, 0);
    }

    public generate(String stream, Integer obc, Integer cbc){
        if (stream.length() == 2*count){
            parenthisisList.add(stream);
            return;
        }

        if(obc < count){
            generate(stream+'(', obc+1, cbc);
        }
        
        if(cbc < obc){
            generate(stream+'(', obc, cbc+1);
        }
    }
}