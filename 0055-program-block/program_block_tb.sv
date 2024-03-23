interface arb_if(input bit clk);
    logic [1:0] grant;
    logic [1:0] request;
    bit rst;

    clocking cb @(posedge clk); // Declare clock block. Ony supported in simulation
        output request;
        input grant;
    endclocking

    modport TEST (clocking cb, output rst);

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


program automatic test_with_program_block (arb_if.TEST arbif);
    initial begin
        @arbif.cb;
        arbif.cb.request <= 2'b01;
        $display("@%0t: Drove req=01", $time);
        repeat(2) @arbif.cb;
        if(arbif.cb.grant == 2'b01)
            $display("@%0t: Success: grant == 2'b01", $time);
        else
            $display("@%0t: Error: grant != 2'b01", $time);
    end
endprogram : test_with_program_block


module top;
    bit clk = 0;
    bit rst = 1;
    arb_if arbif(clk);
    arb_with_ifc a1(arbif);
    test_with_program_block t1(arbif);
    
    always #50 clk = ~clk;

    initial begin
        #100;
        rst = 0;
        arbif.rst = rst;

        #1000;
        $finish;
    end
endmodule : top