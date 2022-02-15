// Use .apex files to store anonymous Apex.
// You can execute anonymous Apex in VS Code by selecting the
//     apex text and running the command:
//     SFDX: Execute Anonymous Apex with Currently Selected Text
// You can also execute the entire file by running the command:
//     SFDX: Execute Anonymous Apex with Editor Contents

// string tempvar = 'Enter_your_name_here';
// System.debug('Hello World!');
// System.debug('My name is ' + tempvar);

// Google_Practice.generateNParenthesis(3);

// Google_Practice g = new Google_Practice(new List<Integer>{2, 4, 6, 8, 9, 10, 56, 19} , 3);
// System.debug(Google_Practice.execute(new List<Integer>{1,2,3,40,50}, 3, 2));
/* System.debug(Google_Practice.execute(new List<List<Integer>>{
    new List<Integer>{1, 2, 3},
    new List<Integer>{4, 5, 6}
})); */
// Google_FindAllPalindrome gi = new Google_FindAllPalindrome();
// System.debug(gi.findAllPalindrome('abba'));

// System.debug(Google_Practice.findMinIndex(new List<Integer>{1,2,2,2,2,2,2,3,4} , 2));
// System.debug(Google_Practice.generateParenthesis(3));
// 1(1), 3(1),

// # Roll up field value on Account


// Create tree and check its height
/* 
      1
    /   \
   2      3
    \
    4
     */
// Google_Practice.Node r = new Google_Practice.Node(1);
// r.left = new Google_Practice.Node(2);
// r.right = new Google_Practice.Node(3);
// r.left.right = new Google_Practice.Node(4);
// System.debug(Google_Practice.getDiameter(r));

// System.debug(Google_Practice.getKthElement(new List<Integer>{2,3,4,13, 14, 20, 23}, 3));

// Google_BitPattern g = new Google_BitPattern();
// g.printPattern('a?cde?',0);

// System.debug('****'+Google_Practice.getUnique(new List<Integer>{1,2,3,1,2,4}));

// 1,2,-3,1,2,-2
// 1,3,0,1,3,1

Google_sortNumbers g = new Google_sortNumbers();
System.debug(g.sortNumber(new List<Integer>{0,0,2,1,2,1,0}));