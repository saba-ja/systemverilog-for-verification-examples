https://www.edaplayground.com/x/Sunn

Sample 2.63

A prime source for unexpected behavior in Verilog has been the width of expres-
sions. Sample 2.63 adds 1+1 using four different styles. Addition A uses two 1-bit
variables, so with this precision 1+1=0. Addition B uses 8-bit precision because there is an 8-bit variable on the left side of the assignment. In this case, 1+1=2.
Addition C uses a dummy constant to force SystemVerilog to use 2-bit precision.
Lastly, in addition D , the fi rst value is cast to be a 2-bit value with the cast operator,
so 1+1=2. There are several tricks you can use to avoid this problem. First, avoid situations
where the overfl ow is lost, as in addition A . Use a temporary, such as b8 , with the
desired width. Or, you can add another value to force the minimum precision, such
as 2 ' b0 . Lastly, in SystemVerilog, you can cast one of the variables to the desired
precision.