https://www.edaplayground.com/x/GKpc

Sample 2.25

Associative arrays can also be addressed with a string index, similar to Perl’s
hash arrays. Sample 2.25 reads a fi le with strings and builds the associative array switch so you can quickly map from a string value to a number.
If you try to read an element of an associative array that has not been written,
SystemVerilog returns the default value for the array base type, such as 0 for 2-state
types such as bit or int , or X for 4-state types such as logic . The simulator may
also give a warning message. You can use the function exists() to check if an
element has been allocated,

You can also declare an associative array with wildcard subscripts, as in wild[*].
However, this style is not recommended as you are allowing an index of almost any
data type. One of the many resulting problems is with foreach –loops: what type is
the variable j in foreach(wild[j] )? Integer, string, bit, or logic?