https://www.edaplayground.com/x/WKKW

Sample 2.29

What is the largest value in an array? Does an array contain a certain value? The
array locator methods fi nd data in an unpacked array. At fi rst you may wonder why
these return a queue of values. After all, there is only one maximum value in an
array. However, SystemVerilog needs a queue for the case when you ask for a value
from an empty queue or dynamic array.
Sample 2.29 shows the array locator methods: min and max functions fi nd the
smallest and largest elements in an array. These methods also work for associative
arrays. The unique method returns a queue of the unique values from the array —
duplicate values are not included.