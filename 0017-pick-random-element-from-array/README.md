https://www.edaplayground.com/x/Mmfv

Sample 2.28

SystemVerilog does not have a method specifi cally for choosing a random ele-
ment from an array, so use the index $urandom_range(array.size()−1) for
queues and dynamic arrays, and $urandom_range($size(array)−1) for fi xed
arrays, queues, dynamic and associative arrays. See Section 6.10 for more informa-
tion on $urandom_range .
If you need to choose a random element from an associative array, you need to step
through the elements one by one as there is no one-line way to access the N th element.
Sample 2.28 shows how to choose a random element from an associative array indexed by integers by fi rst picking a random number, then stepping through the array.
If the array was indexed by a string, just change the type of idx to string .