/**
 * @description       : Function to generate all possible n pairs of balanced parentheses.
 * @author            : rajendra_singh.nagar@syngenta.com
 * @last modified on  : 07-08-2021
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 * Modifications Log 
 * Ver   Date         Author                              Modification
 * 1.0   06-06-2021   rajendra_singh.nagar@syngenta.com   Initial Version
**/
/**
 * * Approach #1: Recurssive
 * 1. Create a recursive function that accepts a string (s), count of opening brackets (o) and count of closing brackets (c) 
 * and the value of n.
 * 2. if the value of opening bracket and closing bracket is equal to n then print the string and return.
 * 3. If the count of opening bracket is greater than count of closing bracket then call the function recursively with the 
 * following parameters String s + “}”, count of opening bracket o, count of closing bracket c + 1, and n.
 * 4. If the count of opening bracket is less than n then call the function recursively with the following parameters String s + 
 * “{“, count of opening bracket o + 1, count of closing bracket c, and n.
 * ! Time Complexity: O(2^n) 
 * ! Space Complexity: O(n)
 */
public inherited sharing class Google_GenerateParenthesis {
    List<String> parenthesisList;
    Integer n;
    public void generateParenthesis(Integer n) {
        parenthesisList = new List<String>();
        this.n = n;
        // write the recursive function to generate parenthesis
        generate('', 0, 0);
        System.debug('****:'+parenthesisList);
    }
    
    public void generate(String stream, Integer open, Integer close){
        // check passed stream length, if > 2 * n, return
        if(stream.length() == 2*n){
            parenthesisList.add(stream);
            return;
        }
        
        // invoke the same function appending (, if open count is less than equal to n
        if(open < n){
            generate(stream+'(', open+1, close);
        }
        
        // invoke the same function appending ), if open count is less than equal to n
        if(close < open){
            generate(stream+')', open, close+1);
        }
    }   
}