https://www.edaplayground.com/x/dSbQ

Sample 2.36

The check_addr() function in Sample 2.36 looks up an address in the score-
board. The fi nd_index() method returns an int queue. If the queue is empty
(size==0), no match was found. If the queue has one member (size==1), a single
match was found, which the check_addr() function deletes. If the queue has mul-
tiple members (size > 1), there are multiple packets in the scoreboard whose address
matching the requested one.
A better choice for storing packet information is a class