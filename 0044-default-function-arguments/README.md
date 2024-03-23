https://www.edaplayground.com/x/QKcx

Sample 3.13

As your testbench grows in sophistication, you may want to add additional controls
to your code but not break existing code. For the function in Sample 3.11 , you might
want to print a checksum of just the middle values of the array. However, you don’t
want to go back and rewrite every call to add extra arguments. In SystemVerilog you
can specify a default value that is used if you leave out an argument in the call.