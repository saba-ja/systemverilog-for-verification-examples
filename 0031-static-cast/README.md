https://www.edaplayground.com/x/QJQe

Sample 2.50

The static cast operation converts between two types with no checking of values.
You specify the destination type, an apostrophe, and the expression to be converted
as shown in Sample 2.50 . Note that Verilog has always implicitly converted between
types such as integer and real, and also between different width vectors.

The dynamic cast, $cast , allows you to check for out-of-bounds values.

Use a static cast when you want SystemVerilog to use a type with
more precision, like when using the sum method for a single bit
array. Use the dynamic cast when converting from a type with a
larger number of values than the destination, such as int to an enu-
merated variable.