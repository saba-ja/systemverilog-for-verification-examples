https://www.edaplayground.com/x/vbqw

Samples 4.4 4.5 4.6 4.7


Make sure you declare your interfaces outside of modules and
program blocks. If you forget, expect all sorts of trouble. Some
compilers may not support defi ning an interface inside a mod-
ule. If allowed, the interface would be local to the module and
thus not visible to the rest of the design. Sample 4.8 shows the common mistake of
including the interface defi nition right after other include statements.

```systemverilog
    module bad_test(arb_if arbif);
    `include "MyTest.sv" // Legal include
    `include "arb_if.sv" // BAD: Interface hidden in module
```


If you have a Verilog-2001 legacy design with ports that cannot be changed to use an
interface, you can just connect the interface’s signals to the individual ports. Sample 4.9
connects the original arbiter from Sample 4.1 to the interface in Sample 4.4 .

```systemverilog
module top;
    bit clk;
    always #50 clk = ~clk;

    arb_if arbif(clk);
    arb_with_port a1 (
        .grant(arbif.grant),
        .request (arbif.request),
        .rst (arbif.rst),
        .clk (arbif.clk));
    test_with_ifc t1 (arbif);
endmodule : top
```