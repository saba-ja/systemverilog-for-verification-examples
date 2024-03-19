https://www.edaplayground.com/x/sb4h

Sample 2.46

The packed keyword in SystemVerilog indicates that the struct's members are placed immediately next to each other in memory without any padding. This is particularly useful for representing hardware structures where bit-level manipulation and alignment are important. Here's how you can complete and extend your example to include both packed and unpacked struct usage:

When you are trying to choose between packed and unpacked structures, consider
how the structure is most commonly used and the alignment of the elements. If you
plan on making aggregate operations on the structure, such as copying the entire
structure, a packed structure is more effi cient. However, if your code accesses
the individual members more than the entire structure, use an unpacked structure. The difference in performance is greater if the elements are not aligned on byte boundaries, have sizes that don’t match the typical byte, or have word instructions
used by processors. Reading and writing elements with odd sizes in a packed struc-
ture requires expensive shift and mask operations.