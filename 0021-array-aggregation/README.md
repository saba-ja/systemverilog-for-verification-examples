https://www.edaplayground.com/x/HxV5

Sample 2.32

Sample 2.32 shows various ways to total up a subset of the values in the array.
The fi rst line compares the item with 7. This relational returns a 1 (true) or 0 (false)
so the calculation is a sum of the array {1,0,1,0,0,0}. The second multiplies the bool-
ean result with the array element being tested. So the total is the sum of {9,0,8,0,0,0},
which is 17. The third calculates the total of elements less than 8. The fourth total is
computed using the ? : conditional operator. The last counts the number of 4’s.

The original example in the book has issue. Casting from bool to int was needed to perform aggrigation on the values.


The array locator methods that return an index, such as fi nd_
index , return a queue of type int , not integer . Your code
may not compile if you use the wrong queue type with these
statements.