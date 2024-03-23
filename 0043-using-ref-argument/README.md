https://www.edaplayground.com/x/EyuQ

Sample 3.11

Verilog had a simple way to handle arguments: an input or inout was copied to a
local variable at the start of the routine, whereas an output or inout was copied
when the routine exited. No memories could be passed into a Verilog routine, only
scalars.

In SystemVerilog, you can specify that an argument is passed by reference, rather
than copying its value. This argument type, ref , has several benefi ts over input,
output , and inout .

SystemVerilog allows you to pass array arguments without the ref direction, but
the array is copied onto the stack, an expensive operation for all but the smallest
arrays.
The SystemVerilog LRM states that ref arguments can only be used in routines
with automatic storage. If you specify the automatic attribute for programs and
module, all the routines inside are automatic. See Section 3.6 for more details on
storage.
Sample 3.11 also shows the const modifi er. As a result, the array a points to the
array in the routine call, but the contents of the array cannot be modifi ed. If you try to
change the contents, the compiler prints an error.
Always use ref when passing arrays to a routine for best perfor-
mance. If you don’t want the routine to change the array values, use
the const ref type, which causes the compiler to check that your
routine does not modify the array.


Common Coding Errors

The most common coding mistake that you are likely to make
with a routine is forgetting that the argument type is sticky with
respect to the previous argument, and that the default type for the
fi rst argument is a single-bit input. Start with the simple task
header in Sample 3.16 .

```systemverilog
task sticky(int a, b);
```

The two arguments are input integers. As you are writing the task, you realize that
you need access to an array, so you add a new array argument, and use the ref type
so it does not have to be copied. Your routine header now looks like Sample 3.17 .

```systemverilog
task automatic sticky(ref int array[50], int a, b); 
```

What argument types are a and b? They take the direction of the previous argu-
ment that is a ref . Using ref for a simple variable such as an int is not usually
needed, but you would not get even a warning from the compiler, and thus would not
realize that you were using the wrong direction.
If any argument to your routine is something other than the default input type,
specify the direction for all arguments as shown in Sample 3.18 .

```systemverilog
task automatic sticky(ref int array[50], input int a, b); // Be explicit
```