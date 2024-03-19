https://www.edaplayground.com/x/WrUp

Sample 2.51, 2.52

When used on the right side of an assignment, the streaming operators << and >>
take an expression, structure, or array, and packs it into a stream of bits. The >>
operator streams data from left to right while << streams from right to left, as shown
in Sample 2.51 . You can also give a slice size, used to break up the source before
being streamed. You can not assign the bit stream result directly to an unpacked
array. Instead, use the streaming operators on the left side of an assignment to
unpack the bit stream into an unpacked array.

A common mistake when streaming between arrays is mis-
matched array subscripts. The word subscript [ 256 ] in an array
declaration is equivalent to [ 0:255 ] , not [ 255:0 ] . Since many
arrays are declared with the word subscripts [ high:low ] ,
streaming them to an array with the subscript [ size ] would result in the elements
ending up in reverse order. Likewise, streaming an unpacked array declared as bit
[ 7:0 ] src[255:0] to the packed array declared as bit [ 7:0 ] [ 255:0 ] dst will
scramble the order of values. The correct declaration for a packed array of bytes is
bit [255:0] [7:0] dst .