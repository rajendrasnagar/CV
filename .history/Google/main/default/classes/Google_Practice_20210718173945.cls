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
    
    // Transpose matrix 
    /* 1,1,1
    2,2,2
    n = 2, m = 3
    0,0
    1,0
    0,1
    1,1
    0,2
    1,2 */

    public static List<List<String>> transposed;
    public static transpose(List<List<String>> matrix){
        // Instantiate matrix
        transpose = new List<List<String>>();
        
        // Get dimensions 
        Integer n = matrix.size();
        Integer m = matrix[0].size();

        for(Integer i = 0; i < m; i++){
            List<Integer> inMatrix = new List<Integer>();
            for(Integer j = 0; j < n; j++){
                inMatrix.add(matrix[j][i]);
            }
            transpose.add(inMatrix);
        }
    }
}