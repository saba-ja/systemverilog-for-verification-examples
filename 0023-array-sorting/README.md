https://www.edaplayground.com/x/9N7L

Sample 2.34

SystemVerilog has several methods for changing the order of elements in an array.
You can sort the elements, reverse their order, or shuffl e the order as shown in
Sample 2.34 . Notice that these change the original array, unlike the array locator
methods in Section 2.6.2 , which create a queue to hold the results.

The reverse and shuffl e methods have no with -clause, so they work on the
entire array.