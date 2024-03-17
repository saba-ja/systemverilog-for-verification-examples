https://www.edaplayground.com/x/efje

sample 2.18

With a single subscript, you get a word of data, barray[0] .With two subscripts,
you get a byte of data, barray[0][3] . With three subscripts, you can access a
single bit, barray[0][1][6] . Because one dimension is specifi ed after the name,
barray[5] , that dimension is unpacked, so you must always give at least one
subscript.


Choosing Between Packed and Unpacked Arrays

Which should you choose — a packed or an unpacked array? A packed array is
handy if you need to convert to and from scalars. For example, you might need to
reference a memory as a byte or as a word. Any array type can be packed, including dynamic arrays, queues and associative arrays.
If you need to wait for a change in an array, you have to use a packed array.
Perhaps your testbench might need to wake up when a memory changes value, so
you want to use the @ operator. This is only legal with scalar values and packed
arrays for example @barray[0].