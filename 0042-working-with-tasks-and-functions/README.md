https://www.edaplayground.com/x/psKW


Verilog makes a very clear differentiation between tasks and functions. The most
important difference is that a task can consume time whereas a function cannot.
A function cannot have a delay, #100 , a blocking statement such as @(posedge
clock) or wait (ready) , or call a task. Additionally, a Verilog function must
return a value and the value must be used, as in an assignment statement.
SystemVerilog relaxes this rule a little in that a function can call a task, but only in
a thread spawned with the fork… join_none statement, which is described in
Section 7.1.


If you have a SystemVerilog task that does not consume time, you
should make it a void function , which is a function that does not
return a value. Now it can be called from any task or function. For
maximum fl exibility, any debug routine should be a void function
rather than a task so that it can be called from any task or function.
Sample 3.4 prints values from a state machine.

```systemverilog

function void print_state();
    $display("@%0t: state = %s", $time, cur_state.name());
endfunction
```

In SystemVerilog, if you want to call a function and ignore its return value, cast the
result to void , as shown in Sample 3.5 . Some simulators, such as VCS, allow you to
ignore the return value without using the void syntax. The LRM says this should be
a warning.

```systemverilog

void'($fscanf(file, "%d", i));
```

SystemVerilog makes several small improvements to tasks and functions to make
them look more like C or C++ routines. In general, a routine defi nition or call with no
arguments does not need the empty parentheses ().


The fi rst improvement you may notice in SystemVerilog routines is that begin…end
blocks are optional, while Verilog-1995 required them on all but single-line routines.
The task / endtask and function / endfunction keywords are enough to
defi ne the routine boundaries, as shown in Sample 3.6 .

```systemverilog

task multiple_lines();
    $display("First line");
    $display("Second line");
endtask : multiple_lines;
```


With SystemVerilog, you can use the less verbose C-style, shown in Sample 3.8 .
Note that you should use the universal input type of logic .

```systemverilog
task mytask2(output logic [31:0] x, input logic y);
    ...
endtask
```

You can take even more shortcuts with declaring routine arguments. The direction
and type default to “input logic” and are sticky, so you don’t have to repeat these for
similar arguments. Sample 3.9 shows a routine header written using the Verilog-1995
style and SystemVerilog data types.

```verilog
task t3();
    input a, b;
    logic a,b;
    output [15:0] u, v;
    bit [15:0] u, v;
endtask
```

You could rewrite this as shown in Sample 3.10 .

```systemverilog
task t3(a, b, output bit [15:0] u, v); // Lazy declarations
    ...
endtask
```

The arguments a and b are input logic, 1-bit wide. The arguments u and v are
16-bit output bit types. Now that you know this, don’t depend on the defaults, as your
code will be infested with subtle and hard to fi nd bugs, as explained in Section 3.4.6 .
Always declare the type and direction for every routine argument.