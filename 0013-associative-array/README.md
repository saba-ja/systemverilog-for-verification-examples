https://www.edaplayground.com/x/8E8q

Sample 2.24
Dynamic arrays are good if you want to occasionally create a big array, but what if
you want something really large? Perhaps you are modeling a processor that has a
multi-gigabyte address range. During a typical test, the processor may only touch a
few hundred or thousand memory locations containing executable code and data, so
allocating and initializing gigabytes of storage is wasteful.
SystemVerilog offers associative arrays that store entries in a sparse matrix. This
means that while you can address a very large address space, SystemVerilog only
allocates memory for an element when you write to it.

An associative array can be stored by the simulator as a tree or hash table. This
additional overhead is acceptable when you need to store arrays with widely sepa-
rated index values, such as packets indexed with 32-bit addresses or 64-bit data
values. An associative array is declared with a data type in square brackets, such as
[ int ] . or [ Packet ] .