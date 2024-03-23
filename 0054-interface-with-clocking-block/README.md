https://www.edaplayground.com/x/vfXT

Sample 4.16

Controlling Timing of Synchronous Signals
with a Clocking Block

An interface can contain multiple clocking blocks, one per clock domain, as there
is a single clock expression in each block. Typical clock expressions are @(posedge
clk) for a single edge clock and @(clk) for a DDR (double data rate) clock.
You can specify a clock skew in the clocking block using the default statement,
but the default behavior is that input signals are sampled just before the design exe-
cutes, and the outputs are driven back into the design during the current time slot. The
next section provides more details on the timing between the design and testbench.
Once you have defi ned a clocking block, your testbench can wait for the clocking
expression with @arbif.cb rather than having to spell out the exact clock and
edge. Now if you change the clock or edge in the clocking block, you do not have
to change your testbench.