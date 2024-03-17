https://www.edaplayground.com/x/eQf_

Sample 2.23

You can use word subscripts and concatenation instead of methods. As a short-
cut, if you put a $ on the left side of a range, such as [$:2] , the $ stands for the
minimum value, [0:2] . A $ on the right side, as in [1:$] , stands for the maximum
value, [1:2] , in fi rst line of the initial block.

The queue elements are stored in contiguous locations, so it is effi cient to push
and pop elements from the front and back. This takes a fi xed amount of time no
matter how large the queue. Adding and deleting elements in the middle of a queue
requires shifting the existing data to make room. The time to do this grows linearly
with the size of the queue.
You can copy the contents of a fi xed or dynamic array into a queue.