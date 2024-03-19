module static_cast_tb();
    int i;
    real r;

    initial begin 
        // Static casts
        i = int'(10.0 - 0.1); // cast is optional
        r = real'(42);        // cast optional

        // Display the values after casting
        $display("i = %d", i); // Displays the value of i
        $display("r = %f", r); // Displays the value of r

    end
endmodule