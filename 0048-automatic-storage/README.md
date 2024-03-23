https://www.edaplayground.com/x/p22t

In Verilog-1995, if you tried to call a task from multiple places in your testbench, the
local variables shared common, static storage, and so the different threads stepped on
each other’s values. In Verilog-2001 you can specify that tasks, functions, and mod-
ules use automatic storage, which causes the simulator to use the stack for local
variables.

In SystemVerilog, routines still use static storage by default, for both
modules and program blocks. You should always make program
blocks (and their routines) use automatic storage by putting the
automatic keyword in the program statement.

Sample 3.23

You can call this task multiple times concurrently, as the addr and expect_data
arguments are stored separately for each call. Without the automatic modifi er, if you
called wait_f or_bus a second time while the fi rst was still waiting, the second call
would overwrite the two arguments.

Variable Initialization

A similar problem occurs when you try to initialize a local vari-
able in a declaration, as it is actually initialized before the start of
simulation. The general solution is to avoid initializing a variable
in a declaration to anything other than a constant. Use a separate
assignment statement to give you better control over when initial-
ization is done.

The task in Sample 3.24 looks at the bus after fi ve cycles and then creates a local
variable and attempts to initialize it to the current value of the address bus.

```systemverilog
program initialization; // Buggy version
    task check_bus();
        repeat(5) @(posedge clock);
        if (bus_cmd === READ) begin
            // When is local_addr initialized?
            logic [7:0] local_addr = addr << 2;; // Bug
            $display("Local addr = %h", local_addr);
        end
    endtask
endprogram
```

The bug is that the variable local_addr is statically allocated, so it is actually ini-
tialized at the start of simulation, not when the begin…end block is entered. Once
again, the solution is to declare the program as automatic as shown in Sample 3.25 .

```systemverilog
program automatic initialization(); // Bug resolved

endprogram
```

Additionally, you can avoid this by never initializing a variable in the declaration,
but this is harder to remember, especially for C programmers. Sample 3.26 show the
recommended style of separating the declaration and initialization.

```systemverilog
logic [7:0] local_addr;
local_addr = addr << 2;
```