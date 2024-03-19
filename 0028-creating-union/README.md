https://www.edaplayground.com/x/d3Wc
Sample 2.45

a union is a special data type that allows you to store different data types in the same memory location. You can define a union with various members, but at any given time, a union can hold a value for only one of its members. The main idea is that a union provides a way to work with different kinds of data while ensuring that the memory footprint is no larger than the largest member.

Unions are useful when you frequently need to read and write a
register in several different formats. However, don’t go overboard,
especially just to save memory. Unions may help squeeze a few
bytes out of a structure, but at the expense of having to create and
maintain a more complicated data structure. Instead, make a class
with a discriminant variable