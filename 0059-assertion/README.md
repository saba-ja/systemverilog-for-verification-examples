

You can create temporal assertions about signals in your design to check their
behavior and temporal relationship with SystemVerilog Assertions (SVA). The sim-
ulator keeps track of what assertions have triggered, so you can gather functional
coverage data on them.

An immediate assertion checks if an expression is true when the statement is exe-
cuted.

Sample 4.37 Checking a signal with an if -statement

```systemverilog
arbif.cb.request <= 2'b01;
repeat (2) @arbif.cb;
if (arbif.cb.grant != 2'b01)
    $display("Error, grant != 2'b01");
```

An assertion is more compact than an if -statement. However, note that the logic
is reversed compared to the if -statement above. You want the expression inside the
parentheses to be true; otherwise, print an error as shown in Sample 4.38 .

```systemverilog
arbif.cb.request <= 2'b01;
repeat (2) @arbif.cb;
a1: assert (arbif.cb.grant == 2'b01);
```

If the grant signal is asserted correctly, the test continues. If the signal does not
have the expected value, the simulator produces a message

4.9.2 Customizing the Assertion Actions

An immediate assertion has optional then- and else-clauses. If you want to augment
the default message, you can add your own as shown in Sample 4.40 .

Sample 4.40 Creating a custom error message in an immediate assertion

```systemverilog
a40: assert (arbif.cb.grant == 2'b01)
     else $error("Grant not asserted");
```
If grant does not have the expected value, you’ll see an error message.

SystemVerilog has four functions to print messages: $info , $warning , $error ,
and $fatal . These are allowed only inside an assertion, not in procedural code,
though future versions of SystemVerilog may allow this.
You can use the then-clause to record when an assertion completed success-
fully as shown in Sample 4.42 .

```systemverilog
a42: assert (arbif.cb.grant == 2'b01)
     grants_received++; // Another successful result
     else
     $error("Grant not asserted");
```

4.9.3 Concurrent Assertions

The other type of assertion is the concurrent assertion that you can think of as a small
model that runs continuously, checking the values of signals for the entire simulation.
These are instantiated similarly to other design blocks and are active for the entire
simulation. You need to specify a sampling clock in the assertion.

Sample 4.43 Concurrent assertion to check for X/Z
Not a good example in the book figure this out from somewhere else. TBD

This Section has provided a brief introduction to SystemVerilog Assertions. For
more information, see Vijayaraghhavan and Ramanathan (2005) and Haque et al.
(2007).


See Sutherland (2006) for more information and examples of using interfaces in
modules