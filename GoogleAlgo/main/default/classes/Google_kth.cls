// Brute way: Using in-built sort
public class Google_kth {
    public list<Integer> numbers {get; set;}
    private Integer kth;
    
    public Google_kth(list<Integer> numbers, Integer kth){
    	this.numbers = numbers;
        this.kth = kth;
    }
    
    public Integer add(Integer appendNumber){
        this.numbers.add(appendNumber);
        this.numbers.sort(); // Time Complexity (considering comparision based sort): nlogn
        return this.numbers.get(numbers.size()-kth);
    }
}