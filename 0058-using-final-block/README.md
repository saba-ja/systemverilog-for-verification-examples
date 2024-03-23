https://www.edaplayground.com/x/Vpig

Sample 4.28

In Verilog, simulation continues while there are scheduled events, or until a $fi nish
is executed. SystemVerilog adds an additional way to end simulation. A program
block is treated as if it contains a test. If there is only a single program, simulation
ends when you complete the last statement in every initial block in the program,
as this is considered the end of the test. Simulation ends even if there are threads
still running in the program or modules. As a result, you don’t have to shut down
every monitor and driver when a test is done.
If there are several program blocks, simulation ends when the last program com-
pletes. This way simulation ends when the last test completes. You can terminate
any program block early by executing $exit . Of course you can still explicitly call
$fi nish to end simulation, but this might cause issues if you have multiple
programs.
However, simulation is not yet over. A module or program can have a fi nal
block that contains code to be run just before the simulator terminates, as shown in
Sample 4.28 . This is a great place to perform clean up work such as closing fi les,
and printing a report of the number of errors and warnings encountered. You cannot
schedule any events, or have any delays in a fi nal block that could cause time to
elapse. You do not have to worry about freeing any memory that was allocated as
this will be done automatically.


4.5.2
111
Why are Always Blocks not Allowed in a Program?
In SystemVerilog you can put initial blocks in a program, but not always blocks.
This may seem odd if you are used to Verilog modules, but there are several reasons
SystemVerilog programs are closer to a program in C, with one (or more) entry
points, than Verilog’s many small blocks of concurrently executing hardware. In a
design, an always block might trigger on every positive edge of a clock from the
start of simulation. In contrast, a testbench has the steps of initialization, stimulate
and respond to the design, and then wrap up simulation. An always block that runs
continuously would not work.
When the last initial block completes in the program, simulation implicitly
ends just as if you had executed $fi nish . If you had an always block, it would run
for ever, so you would have to explicitly call $exit to signal that the program com-
pleted. But don’t despair. If you really need an always block, you can use initial
forever to accomplish the same thing.

4.5.3
The Clock Generator

Sample 4.29 tries to
put the generator in a program block but just causes a race condition. The clk and
data signals both propagate from the Reactive region to the design in the Active
region and could cause a race condition depending on which one arrived fi rst.

Bad clock generator in program block
```systemverilog
program automatic bad_generator (output bit clk, data);
    initial begin
        forever #5 clk <= ~clk;
    end

    initial begin
        forever @(posedge clk)
            data <= ~data;
    end
endprogram
```

Avoid race conditions by always putting the clock generator in a
module. If you want to randomize the generator’s properties, create
a class with random variables for skew, frequency, and other char-
acteristics.

Sample 4.30 shows a good clock generator in a module. It deliberately avoids an
edge at time 0 to prevent race conditions. All clock edges are generated with a
blocking assignment to trigger events during the Active region. If you must generate
a clock edge at time 0, use a nonblocking assignment to set the initial value so all
clock sensitive logic such as always blocks will have started before the clock
changes value.

Sample 4.30
Good clock generator in module

```systemverilog
module clock_generator (outpput bit clk);
    bit local_clk = 0;
    assign clk = local_clk;
    
    always #50 local_clk = ~local_clk;
endmodule
```
Lastly, don’t try to verify the low-level timing with functional veri-
fi cation. The testbenches described in this book check the behavior
of the DUT but not the timing, which is better done with a static
timing analysis tool. Your testbenches should be fl exible enough to
be compatible with gate-level simulations run with back-annotated
timing.