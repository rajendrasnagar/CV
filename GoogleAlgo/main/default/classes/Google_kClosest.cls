/**
 * @description       : Given a sorted number array and two integers ‘K’ and ‘X’, find ‘K’ closest numbers to ‘X’ in the array. 
                        Return the numbers in the sorted order. ‘X’ is not necessarily present in the array.
 * @author            : rajendra_singh.nagar@syngenta.com
 * @last modified on  : 07-08-2021
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 * Modifications Log 
 * Ver   Date         Author                              Modification
 * 1.0   06-04-2021   rajendra_singh.nagar@syngenta.com   Initial Version
**/
public class Google_kClosest {
    public List<Integer> oarr; 
    /**
     * * Approach #1
     * 1. Subtract given number from all array entries, except for the one where it is same
     * 2. Store the subtracted value as key & array val as value in the Map. This will collect distance of all values from x.
     * 3. Collect the map keyset in list & sort it. 
     * 4. Get top K values and collect in separate list.
     * 5. Sort the list to get the sorted order.
     * ! Time Complexity: O(n)
     */
    public Google_kClosest(List<Integer> inputArray, Integer k, Integer x){
        oarr = inputArray;
        Map<Integer, Integer> kMap = new Map<Integer, Integer>();
        for(Integer val: inputArray){
            if(x!=val){
            	kMap.put(Math.abs(x-val), val);   
            }
        }
        
        List<Integer> kList = new List<Integer>();
        List<Integer> kSet = new List<Integer>(kMap.keySet());
        
        // Time Complexity: nlogn (as it is comparison based sort)
        kSet.sort();
        System.debug('***kSet:'+kSet);
        
        // Time Complexity: O(k)
        // retrieve the top k elements
        Integer i=1;
        for(Integer keyVal : kSet){
            System.debug('***keyVal:'+keyVal);
            if(i<=k){
            	kList.add(kMap.get(keyVal));   
            }
            i++;
        }
        
        System.debug('***kList'+kList);

        // sort again to get the correct order
        kList.sort();
    }

    /**
     * * Approach #2 - Crossover
     * 1. Find x element position in the array (Crossover point) using binary search(divide and conquer).
     * 2. Use two variable to store left & right index of the mid point. If x is present at the mid point, decrement it further.
     * 3. Start checking left & right side of the mid point. Check whether left difference is greater or right one.
     * 4. Store the element with less difference in array and decrement that side index (left / right)
     * * Edge case:
     * 1. If count is still less than k, than check on both left and right side.
     * 2. If left side index is greater than 0, then add value using left side index & decrement.
     * 3. If right side index is less than size, then add value using right side index & increment.
     * !  Complexity: O(logn) (Binary Search)  + O(k) (Searching for k element) => O(logn+k)*
     *    The idea is to use Binary Search to find the crossover point. Once we find index of crossover point, 
     *    we can print k closest elements in O(k) time. 
     */
    // list to store k close elements
    List<Integer> kElements = new List<Integer>();
    public void findKClosest(List<Integer> stream, Integer k, Integer x){
        // Use cross over to find the midpoint
        Integer l = crossover(stream, x, 0, stream.size()-1);
        Integer r = l+1;
        System.debug('***crossover'+i);
        
        // If value exists at the crossover point
        if(stream[l]==x){
            l--;
        }
        
        // compare elements on left & right to find k closest number
        Integer count=0;
        while (l>=0 && r<stream.size() && count<k){
            System.debug('***'+k+':'+(k-stream[l]));
            System.debug('***'+k+':'+(k-stream[r]));            
            
            if(x-stream[l] < stream[r]-x){
                kElements.add(stream[l--]);
            }else{
                kElements.add(stream[r++]);
            }
            count++;
        }
        
        // Edge cases - where crossover is found either at start / end
        while(count < k && l >=0){
            kElements.add(stream[l--]);
            count++;
        }
        
        while(count < k && r < stream.size()){
            kElements.add(stream[r++]);
            count++;
        }
    }

    private integer crossover(List<Integer> stream, Integer x, Integer low, Integer high){
        // edge cases - value is less than all 
        if(x<stream[low]){
            return low;
        }
        // edge cases -value is greater than all
        if(x>stream[high]){
            return high;
        }
        
        // find the mid point 
        Integer mid = (low+high)/2;
           
        /* if x fits in mid */
        System.debug('***stream[mid]:'+stream[mid]);
        if(stream[mid]<=x && stream[mid+1]>x){
            return mid;
        }
        
        if(x>stream[mid]){
            return crossover(stream, x, mid+1, high);
        }
        high=mid;
        return crossover(stream, x, 0, mid);
    }
}