`timescale 1ns / 1ps

module mux2to1_tb();
    logic in0;
    logic in1;
    logic sel;
    logic out;

    mux2to1 uut (
        .in0(in0),
        .in1(in1),
        .sel(sel),
        .out(out)
    );

    initial begin
        in0 = 0;
        in1 = 0;
        sel = 0;

        #10 
        in0 = 0;
        in1 = 1;
        sel = 0;
        
        #10 
        assert(out == in0) 
            $display("[Pass] Test case 1"); 
        else 
            $error("[Fail] Test case 1 failed: in0=%b, in1=%b, sel=%b, out=%b", in0, in1, sel, out);

        #10 
        in0 = 0;
        in1 = 1;
        sel = 1;
        
        #10 
        assert(out == in1) 
            $display("[Pass] Test case 2"); 
        else 
            $error("[Fail] Test case 2 failed: in0=%b, in1=%b, sel=%b, out=%b", in0, in1, sel, out);

        #10 
        in0 = 1;
        in1 = 0;
        sel = 0;
        
        #10 
        assert(out == in0) 
            $display("[Pass] Test case 3"); 
        else 
            $error("[Fail] Test case 3 failed: in0=%b, in1=%b, sel=%b, out=%b", in0, in1, sel, out);

        #10 
        in0 = 1;
        in1 = 0;
        sel = 1;
        
        #10 
        assert(out == in1) 
            $display("[Pass] Test case 4"); 
        else 
            $error("[Fail] Test case 4 failed: in0=%b, in1=%b, sel=%b, out=%b", in0, in1, sel, out);
        
    end

    // Dump the changes in the values of nets and registers in a file 
    initial begin
        $dumpfile("mux2to1.vcd");
        $dumpvars(0, mux2to1_tb);
    end

endmodule