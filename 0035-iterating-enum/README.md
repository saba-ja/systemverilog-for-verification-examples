https://www.edaplayground.com/x/Bckf

Sample 2.59

Note that there is no clean way to write a for loop that steps through all members
of an enumerated type if you use an enumerated loop variable. You get the starting
member with fi rst function and the next member with next . A for loop ends when
the loop variable is outside the defi ned bounds, but the next function always returns
a value inside the enumeration. If you use the test current!= current.last() ,
the loop ends before using the last value. If you use current<=current. last () , you
get an infi nite loop, as next never gives you a value that is greater than the fi nal
value. This is similar to trying to make a for loop that steps through the values 0..3
with an index declared as bit [1:0] . The loop never exits! You can get around this
limitation by either using an integer variable in the loop, or incrementing the
enumerated variable, but both of these solutions can give illegal values if your
enumerated values are not contigious, such as 1, 2, 3, 5, 8.
You can use a do…while loop to step through all the values, checking when the
value wraps around, as shown in Sample 2.59 .