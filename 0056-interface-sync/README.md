https://www.edaplayground.com/x/DLfN

Sample 4.19


When using modports with clocking blocks, a synchronous
interface signal such as request must be prefi xed with both the
interface name, arbif , and the clocking block name, cb . So in
Sample 4.21 , arbif.cb.request is legal, but arbif.
request is not. This is the most common coding mistake with interfaces and clock-
ing blocks.

You should always drive interface signals in a clocking block with a synchronous
drive using a nonblocking assignment. This is because the design signal does not
change immediately after your assignment – remember that your testbench executes
in the Reactive region while design code is in the Active region. If your testbench
drives arbif.cb.request at 100ns, the same time as arbif.cb (which is
@(posedge clk) according to the clocking block), request changes in the design
at 100ns. However, if your testbench tries to drive arbif.cb.request at time
101ns, between clock edges, the change does not propagate until the next clock
edge. In this way, your drives are always synchronous. In Sample 4.20 , arbif.
grant is driven by a module and can use a blocking assignment.
If the testbench drives the synchronous interface signal at the active edge of the
clock, as shown in Sample 4.22 , the value propagates immediately to the design.
This is because the default output delay is #0 for a clocking block. If the testbench
drives the output just after the active edge, the value is not seen in the design until
the next active edge of the clock.

Sample 4.22

```systemverilog
busif.cb.request <= 1; // Synchronous drive
busif.cb.cmd <= cmd_buf; // Syncrhonous drive
```

Driving clocking block signals asynchronously can lead to dropped values.
Instead, drive at the clock edge by using a cycle delay prefi x on your drives as
shown in Sample 4.24 .

```systemverilog
##2 arbif.cb.request <= 0; // Wait for 2 cycles then assign
##3; // Illegal - must be used with an assignment
```

If you want to wait for two clock cycles before driving a signal, you can either
use “ repeat (2) @arbif.cb ;” or use the cycle delay ##2 . This latter delay only
works as a prefi x to a drive of a signal in a clocking block, as it needs to know which
clock to use for the delay.
The cycle delay of ##0 in an assignment that drives the value immediately if the
clock was asserted in this time slot, according to the clocking block. If the clock was
not just asserted, the signal is driven at the next active edge of the clock. The cycle
delay of ##1 always waits for the next active edge of the clock, even if the clock was
asserted in the current time slot.
The naked cycle delay statement ##3 ; works if you have a default clocking block
for your program or module. This book only recommends putting a clocking block in
an interface and not creating a default clocking block. You should always be specifi c
about which clock is being referenced.