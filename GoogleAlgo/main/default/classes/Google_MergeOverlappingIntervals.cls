/**
 * Approach #1: Use List & Set
 * ! Complexity: O(n^2)
 * 1. Create a variable (mergedElement) and use 1st inner list as its value.
 * 2. Iterate over the list of list. In the inner iteration, check whether the second list 1st element is "<=" 2nd element of fist list.
 *    i.e. [[1, 4], [3, 8]], here 2nd element of fist list is 4 & 1st element for second list is 3.
 * 3. If the 1st & 2nd list are overlapping update mergedElement variable, else leave it. At the end of inner loop, 
 *    update the merged value in a list.
 * 4. Also, create a set to to store the merged inner list indexes.
 * 5. In the subsequent iterations, skip the ones already merged. Use set created above.
 */
/* System.debug(g.mergeIntervals(new List<List<Integer>>{
    new List<Integer>{1, 3},
    new List<Integer>{2, 5},
    new List<Integer>{6, 8}
})); */
public inherited sharing class Google_MergeOverlappingIntervals {
    public List<List<Integer>> mergeIntervals(List<List<Integer>> intervals){
        // list to hold merged values
        List<List<Integer>> mergedIntervals = new List<List<Integer>>();
        // variable to store intermiditate results
        List<Integer> mergedOne;
        // variable to store entries to be skipped
        List<Integer> skipIndices = new List<Integer>();
        // get the size of the interval list
        Integer size = intervals.size();
        // iterate over the intervals, checking each inner interval one by one.
        for (Integer i=0; i<size; i++){
            // invoke only if the index is not already included
            if(!skipIndices.contains(i)){
                // clonning is required as otherwise it will impact original array
                mergedOne = intervals[i].clone();
                for (Integer j=i+1; j<size; j++){
                    List<Integer> inter = intervals[j];
                    // if overlapping
                    if(mergedOne[1] >= inter[0] && !skipIndices.contains(j)){
                        // update the interval
                        mergedOne[1] = inter[1];
                        // add in the skip set
                        skipIndices.add(j);
                    }
                }
                // At the end of inner loop include the interval in separate list
                mergedIntervals.add(mergedOne);
                System.debug('***mergedIntervals:'+mergedIntervals);
                System.debug('***skipIndices:'+skipIndices);
            }
        }
        return mergedIntervals;
    }

    /**
     * Approach #2: Single for loop - Assuming the intervals are sorted
     * ! Complexity: O(n)
     * 1. We will create one output list where we will store 1st value before the iteration starts.
     * 2. While iterating, check if the passed interval overlaps.
     * 3. If it overlaps, merge the intervals. Else add the interval as new one in the output list.
     */
    public List<List<Integer>> getMergedIntervals(List<List<Integer>> intervals){
        // Maintain list of output intervals
        List<List<Integer>> outputIntervals = new List<List<Integer>>();
        outputIntervals.add(intervals[0]);

        Integer size = intervals.size();
        Integer opIntervelIndex = 0;
        for(Integer i=1; i < size; i++){
            // merge condition - next interval start is less than current one
            if(outputIntervals[opIntervelIndex][1] >= intervals[i][0]){
                outputIntervals[opIntervelIndex][1] = intervals[i][1];
            }else{
                // add it in the output list
                outputIntervals.add(intervals[i]);
                // increment opIntervelIndex
                opIntervelIndex++;
            }
        }

        // return the results
        return outputIntervals;
    }
}