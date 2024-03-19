module creating_union_tb();
    
    // Use the suffi x “ _u ” when declaring a union.
    typedef union {
        bit [31:0] b; // Unsigned 32-bit
        int i;        // Signed 32-bit
    } num_u;

    num_u un;

    initial begin
        // Assign -1 to the signed view
        un.i = -1;
        $display("Signed view %0d", un.i);   // -1
        $display("Unsigned view %0h", un.b); // ffffffff

        // Let's see how bit manupulation affects both views
        un.b = un.b & 32'h0FFF_FFFF;
        $display("After masking with 0FFFFFFFF");
        $display("Signed view: %0d", un.i);   // 268435455
        $display("Unsigned view: %0h", un.b); // fffffff

        // Now let's assign a positive value and see the effects
        un.i = 123456789;
        $display("After assigned 123456789 to signed view");
        $display("Signed view: %0h", un.i);   // 75bcd15
        $display("Unsigned view: %0h", un.b); // 75bcd15

        // Assigning a large unsigned value to see how it looks in signed view
        un.b = 32'hF1234567;
        $display("After assigning F1234567 to unsigned view");
        $display("Signed view: %0d", un.i);   // -249346713
        $display("Unsigned view: %0h", un.b); // f1234567
    end
endmodule
