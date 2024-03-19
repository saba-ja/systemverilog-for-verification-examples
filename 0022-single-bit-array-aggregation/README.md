https://www.edaplayground.com/x/7Czn

Sample 2.33

Be careful of SystemVerilog’s rules for the width of operations.
Normally, if you were to add a set of single bit values, SystemVer-
ilog would make the calculations with enough precision not to
lose any bits. But the sum method uses the width of the array. So,
if you add the values of a single-bit array, the result is a single bit, which is probably
not what you expected. The solution is to use a with expression as shown in
Sample 2.33 .