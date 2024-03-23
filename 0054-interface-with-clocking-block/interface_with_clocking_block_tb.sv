interface arb_if(input bit clk);
    logic [1:0] grant;
    logic [1:0] request;
    bit rst;

    clocking cb @(posedge clk); // Declare clock block. Ony supported in simulation
        output request;
        input grant;
    endclocking

    modport TEST (clocking cb, output rst);

    modport DUT (input request, rst, clk, output grant);


endinterface


module arb_with_ifc (arb_if arbif);
    always @(posedge arbif.clk or posedge arbif.rst) begin
        if(arbif.rst)
            arbif.grant <= '0;
        else if (arbif.request[0])
            arbif.grant <= 2'b01;
        else if (arbif.request[1])
            arbif.grant <= 2'b10;
        else
            arbif.grant <= '0;
    end
endmodule


module test_with_cb (arb_if.TEST arbif);
    initial begin
        @arbif.cb;
        arbif.cb.request <= 2'b01;
        @arbif.cb;
        $display("@%0t: Grant = %b", $time, arbif.cb.grant);
        @arbif.cb;
        $display("@%0t: Grant = %b", $time, arbif.cb.grant);
        $finish;
    end
endmodule

      
module top;
    bit clk = 0;
    bit rst = 1;
    arb_if arbif(clk);
    arb_with_ifc a1(arbif);
    test_with_cb t1(arbif);
    
    always #50 clk = ~clk;

    initial begin
        #100;
        rst = 0;
        arbif.rst = rst;

        #1000;
        $finish;
    end
endmodule : top