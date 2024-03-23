https://www.edaplayground.com/x/ZTUn

Sample 3.20

Verilog had a primitive way to end a routine; after you executed the last statement in
a routine, it returned to the calling code. In addition, a function returned a value by
assigning that value to a variable with the same name as the function.

SystemVerilog adds the return statement to make it easier for you to control the
fl ow in your routines. The task in Sample 3.19 needs to return early because of error
checking.