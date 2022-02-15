/**
 * @description       : Transpose a matrix
 * @author            : rajendra_singh.nagar@syngenta.com
 * @last modified on  : 06-19-2021
 * @last modified by  : rajendra_singh.nagar@syngenta.com
 * Modifications Log 
 * Ver   Date         Author                              Modification
 * 1.0   06-19-2021   rajendra_singh.nagar@syngenta.com   Initial Version
**/
public inherited sharing class Google_TransposeMatrix {
    public List<List<Integer>> transpose(List<List<Integer>> matrix) {
        Integer n = matrix.size();
        Integer m = matrix[0].size();
        
        List<List<Integer>> transpose = new List<List<Integer>>();
        
        for(Integer i=0; i < m; i++){
            List<Integer> innerList = new List<Integer>();
            for(Integer j=0; j < n; j++){
                // Create a list and add elements there
                innerList.add(matrix[j][i]);
            }
            transpose.add(innerList);
        }
        
        return transpose;
    }
}