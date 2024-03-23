

The modport construct in an interface lets you
group signals and specify directions.

Sample 4.10 4.11

```systemverilog
interface arb_if(input bit clk);
    logic [1:0] grant;
    logic [1:0] request;

    modeport TEST (
        output request, 
        output rst,
        input grant,
        input clk
        );

    modeport DUT (
        input request,
        input rst,
        input clk,
        output grant
    );

    modeport MONITOR(
        input request,
        input grant,
        input rst,
        input clk
    );
endinterface

module arb_with_mp (arb_if.DUT arbif);
    ...
endmodule

module test_with_mp (arb_if.TEST arbif);
    ...
endmodule

module top;
    logic [1:0] grant;
    logic [1:0] request;
    bit clk;
    always #50 clk = ~clk;

    arb_if arbif(clk);
    arb_with_mp a1 (arbif.DUT);
    test_with_mp t1 (arbif.TEST);
endmodule 


// Sample 4.14 Arbiter monitor with interface using modports
module monitor (arb_if.MONITOR arbif);
    always @(posedge arbif.request[0]) begin
        $display("@%0t: request[0] asserted", $time);
        @(posedge arbit.grant[0]);
        $display("@%0t: grant[0] asserted", $time);
    end

    always @(posedge arbif.request[1]) begin
        $display("@%0t: request[1] asserted", $time);
        @(posedge arbif.grant[1]);
        $display("@%0t: grant[1] asserted", $time);
    end
endmodule
```

Logic vs. Wire in an Interface

Sample 4.15 Driving logic and wires in an interface

```systemverilog
interface asynch_if();
    logic 1;
    wire w;
endinterface

module test(asynch_if ifc);
    logic local_wire;
    assign ifc.w = local_wire;

    initial begin
        ifc.l <= 0;       // Drive asynch logic directly
        local_wire <= 1;  // but drive wire through assign
endmodule

```

Another reason to use logic for interface signals is that the compiler will give
an error if you unintentionally use multiple structural drivers.