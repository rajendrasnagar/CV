/**
 * @description       : Practice class
 * @author            : rajendra_singh.nagar@syngenta.com
 * @last modified on  : 07-09-2021
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 * Modifications Log 
 * Ver   Date         Author                              Modification
 * 1.0   06-07-2021   rajendra_singh.nagar@syngenta.com   Initial Version
**/

/* {1,2,3}
{4,5,6}
=> transpose
{1,4}
{2,5}
{3,6} */

public inherited sharing Class Google_Practice{
    public static Integer execute(List<Integer> stream){
        Map<Integer, Integer> sumMap = new Map<Integer, Integer>{0=>1};
        Integer index=-1;
        Integer oCount=0;
        Integer sum=0;
        // Iterate over the stream to store sum and sum occurance count
        while(index < stream.size()-1){
            index++;
            sum+=stream[index];
            System.debug('***sum:'+sum);
            if(!sumMap.containsKey(sum)){
                sumMap.put(sum, 1);
                System.debug('***sum:>>'+sum);
            }else{
                oCount+=sumMap.get(sum);
                sumMap.put(sum, sumMap.get(sum)+1);
            }
        }
        System.debug('***'+sumMap);
        return oCount;
    }
}