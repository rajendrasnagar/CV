/**
 * @description       : Implement LRU
 * @author            : rajendra_singh.nagar@syngenta.com
 * @last modified on  : 06-07-2021
 * @last modified by  : rajendra_singh.nagar@syngenta.com
 * Modifications Log 
 * Ver   Date         Author                              Modification
 * 1.0   06-07-2021   rajendra_singh.nagar@syngenta.com   Initial Version
**/
public inherited sharing class Google_LRU {

    public Integer cacheSize=2;

    public Google_LRU(){}

    public Google_LRU(Integer cacheSize){
        this.cacheSize = cacheSize;
    }

    private Map<Integer, String> cacheMap = new Map<Integer, String>();
    private List<Integer> cacheList = new List<Integer>();

    public String getValue(Integer i){
        updateCache(i);

        return cacheMap.get(i);
    }

    public String addValue(Integer i, String val){
        updateCache(i);

        return cacheMap.put(i, val);
    }

    private void updateCache(Integer i){
        if(cacheList.size()==cacheSize){

            System.debug('***c:'+cacheList[0]);

            // get least used value - at 0th index & remove it from map
            cacheMap.remove(cacheList[0]);

            // iterate over the list & remove the first value
            for(Integer j = 1; j < cacheSize-1; j++){
                cacheList[j-1]=cacheList[j];
            }
            // update last one
            cacheList[cacheSize-1]=i;

        }else{
            cacheList.add(i);
        }
    }
}