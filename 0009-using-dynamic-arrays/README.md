https://www.edaplayground.com/x/Wjbi
sample 2.19

SystemVerilog provides a dynamic array that can
be allocated and resized during simulation so your simulation consumes a minimal
amount of memory.
A dynamic array is declared with empty word subscripts [] . This means that you
do not specify the array size at compile time; instead, give it at run time. The array is
initially empty, so you must call the new[] constructor to allocate space, passing in
the number of entries in the square brackets. If you pass an array name to the new[]
constructor, the values are copied into the new elements,