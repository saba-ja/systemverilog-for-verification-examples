https://www.edaplayground.com/x/PEmk

Sample 2.21

You can make assignments between fi xed-size and dynamic arrays as long as
they have the same base type such as int . You can assign a dynamic array to a fi xed
array as long as they have the same number of elements.

When you copy a fi xed-size array to a dynamic array, SystemVerilog calls the
new[] constructor to allocate space, and then copies the values.