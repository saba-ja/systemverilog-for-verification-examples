module expression_width_pitfalls_tb();
    bit [7:0] b8;
    bit one;
    
    initial begin
        one = 1'b1;             // single bit
        $displayb(one + one);   // binary 1 + 1 = 0

        b8 = one + one;         // 1 + 1 = 2
        $displayb(b8);          // 0000_0010

        $display(one + one + 2'b0); // 1 + 1 = 2 using constant

        $display(2'(one) + one);    // 1 + 1 using cast
    end
endmodule