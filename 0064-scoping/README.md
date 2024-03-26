https://www.edaplayground.com/x/7_46

Sample 5.18

5.12
Scoping Rules
When writing your testbench, you need to create and refer to many variables.
SystemVerilog follows the same basic rules as Verilog, with a few helpful
improvements.
A scope is a block of code such as a module, program, task, function, class, or
begin/end block. The for and foreach loops automatically create a block so
that an index variable can be declared or created local to the scope of the loop.
You can only defi ne new variables in a block. New in SystemVerilog is the abil-
ity to declare a variable in an unnamed begin-end block.
A name can be relative to the current scope or absolute starting with $root . For
a relative name, SystemVerilog looks up the list of scopes until it fi nds a match. If
you want to be unambiguous, use $root at the start of a name. Variables can not be
declared in $root , that is, outside of any module, program or package.

For testbenches, you can declare variables in the program or in the initial
block. If a variable is only used inside a single initial block, such as a counter,
you should declare it there to avoid possible name confl icts with other blocks. Note
that if you declare a variable in an unnamed block, such as the initial in Sample
5.18 , there is no hierarchical name that works consistently across all tools.
Declare your classes outside of any program or module in a
package . This approach can be shared by all the testbenches, and
you can declare temporary variables at the innermost possible
level. This style also eliminates a common bug that happens when
you forget to declare a variable inside a class. SystemVerilog looks
for that variable in higher scopes.
If a block uses an undeclared variable, and another variable with
that name happens to be declared in the program block, the class
uses it instead, with no warning. In Sample 5.19 , the function
Bad::display did not declare the loop variable i , so SystemVer-
ilog uses the program level i instead. Calling the function changes the value of
test.i , probably not what you want!

```systemverilog
program automatic test;
    int i; // Program-level variable

    class Bad;
        logic [31:0] data[];
        // Calling this function changes the program variable i

        function void display();
            // Forgot to declare i in next statement

            for (i=0; i < data.size(); i++)
                $display("data[%0d]=%x", i, data[i]);
        endfunction
    endclass
endprogram
```

If you move the class into a package, the class cannot see the program-level
variables, and thus won’t use them unintentionally as shown in Sample 5.20 .

```systemverilog
package Better;
    class Bad;
        logic [31:0] data[];

        // Will not compile because of undeclared i
        function(i=0; i < data.size(); i++)
            $display("data[%0d]=%x", i, data[i]);
        endfunction
    endclass
endpackage

program automatic test;
    int i; // Program-level variable
    import Better::*;
    // ...
endprogram
```