https://www.edaplayground.com/x/mwU7

Sample 3.22

Verilog routines could only return a simple value such as a bit, integer, or vector. If
you wanted to compute and return an array, there was no simple way. In System
Verilog, a function can return an array, using several techniques.
The fi rst way is to defi ne a type for the array, and then use that in the function
declaration. Sample 3.21 uses the array type from Sample 2.40, and creates an func-
tion to initialize the array.

https://www.edaplayground.com/x/Xr9d
```systemverilog
module returning_array_from_func_with_typedef();

    typedef int fixed_array5_t[5];

    fixed_array5_t f5;

    function fixed_array5_t init(input int start);
      /* Remember
      Verilog had a primitive way to end a routine; after you executed the last statement in
a routine, it returned to the calling code. In addition, a function returned a value by
assigning that value to a variable with the same name as the function.
So in the following case the init is a variable with the same name as the function.
      */
      $display("I was called with start value %0d", start);
        foreach (init[i])
            init[i] = i + start;
    endfunction

    initial begin
        f5 = init(5);
        foreach (f5[i])
            $display("f5[%0d] = %0d", i, f5[i]);
    end

endmodule
```

One problem with the preceding code is that the function init creates an array,
which is copied into the array f5 . If the array was large, this could be a large perfor-
mance problem.
The alternative is to pass the routine by reference. The easiest way is to pass the
array into the function as a ref argument, as shown in Sample 3.22 .

The last way for a function to return an array is to wrap the array inside of a class,
and return a handle to an object.