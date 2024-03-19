module custom_type_with_typedef_tb();
    
    // Example: Using typedef in SystemVerilog
    parameter OPSIZE = 8;
    typedef logic [OPSIZE-1:0] opreg_t;

    opreg_t op_a;
    opreg_t op_b;

    // The following definitions are equivalent
    typedef bit [31:0] uint_x_t;    // 32-bit unsigned 2-state
    typedef int unsigned uint_y_t;  // 

  
  	uint_x_t ux;
  	uint_y_t uy;
  
    // Defining a type for fixed size array
    typedef int fixed_array5_t[5];
    fixed_array5_t f5; // Equivalent to int f5[5];

    // User defined associative array index
    typedef bit [63:0] bit64_t;
    bit64_t assoc[bit64_t];
    bit64_t idx;

    initial begin
        // Initialized the variables
        op_a = 8'hDE;
        op_b = 8'hAD;

        ux = 32'd1234567890; 
        uy = ux;

        f5 = '{10, 20, 30, 40, 50};
        idx = 64'd1;
        do begin
            assoc[idx] = idx;
            idx = 1 << idx;
        end while(idx != 0);

        // Display values
        $display("op_a = %0h", op_a);
        $display("op_b = %0h", op_b);
        $display("ux = %0d", ux);
        $display("uy = %0d", uy);
        $display("f5 = %p", f5);
        $display("assoc = %p", assoc);

    end

endmodule