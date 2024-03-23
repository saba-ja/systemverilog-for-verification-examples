https://www.edaplayground.com/x/q88N

Sample 4.25

In Verilog-1995, if you want to drive a bidirectional signal such as a port from
procedural code, you need a continuous assignment to connect the reg to the wire .
In SystemVerilog, synchronous bidirectional signals in interfaces are easier to use
as the continuous assignment is added for you, as shown in Sample 4.25 . When you
write to the net from a program, SystemVerilog actually writes to a temporary vari-
able that drives the net. Your program reads directly from the wire, seeing the value
that is resolved from all the drivers. Design code in a module still uses the classic
register plus continuous assignment statement.

Specifying Delays in Clocking Blocks

A clocking block ensures that your signals are driven and sampled at the specifi ed
clock edge. You can skew these times with either a default statement, or by speci-
fying the delays for individual signals. This can be useful when simulating netlists
with real delays. Sample 4.26 shows a clocking block with a default statement that
has the skews for all signals. In this example, the inputs are sampled 15ns before the
posedge of the clock and the outputs are driven 10ns after the posedge of the clock.

```systemverilog
clocking cb @(posedge clk);
    default input #15ns output #10ns;
    output request;
    input grant;
endclocking
```
Sample 4.27 shows the equivalent clocking block, but with the delays specifi ed
on the individual signals.

```systemverilog
clocking cb @(posedge clk);
    output #10ns request;
    input #15ns grant;
endclocking
```
