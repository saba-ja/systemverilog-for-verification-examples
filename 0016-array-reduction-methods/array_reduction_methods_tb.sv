module array_reduction_methods_tb();
    byte b[$] = {2, 3, 4, 5};

    int w;

    initial begin
        // The parentheses are optional if there are no arguments.
        w = b.sum();               // 14 = 2 + 3 + 4 + 5
        $display("b.sum = %d", w);

        w = b.product();           // 120 = 2 * 3 * 4 * 5
        $display("b.product = %d", w);

        w = b.and();           
        $display("b.and = %d", w); // 0000_0000 = 2 & 3 & 4 & 5
        
        w = b.or();           
      $display("b.or = %d", w); // 7 = 2 | 3 | 4 | 5

        w = b.xor();           
      $display("b.xor = %d", w); // 0 = 2 ^ 3 ^ 4 ^ 5

    end
endmodule