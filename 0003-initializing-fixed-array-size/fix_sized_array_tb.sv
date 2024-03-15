module fix_sized_array_tb();

    initial begin
        int arr_x[4];
        int arr_y[5];

        bit [0:4][31:0] src;
        bit [0:4][31:0] dst;
        // ---------------------------------------------------------------------
        // Initializing arrays and priting elements using foreach
        // ---------------------------------------------------------------------
        arr_x = '{3, 2, 1, 0}; // Set 4 elements
        foreach (arr_x[i]) 
            $display("arr_x[%0d] = %0d", i, arr_x[i]);

        arr_y = '{4, 3, 2, 1, 0}; // Set 5 elements of the array 
        foreach (arr_y[i]) 
            $display("arr_y[%0d] = %0d", i, arr_y[i]);

        // ---------------------------------------------------------------------
        // Initializing arrays and priting elements using for loop
        // ---------------------------------------------------------------------
        $display("Original Values:");
        for (int i=0; i < $size(src); i++) begin
            src[i] = i;
            $display("src[%0d] = %0d", i, src[i]);
        end
        
        $display("New Values:");
        foreach (dst[i]) begin
            dst[i] = src[i] * 2;
            $display("dst[%0d] = %0d", i, dst[i]);
        end
        
        // These methoeds are not support in the simulator Icarus, 
        // but are supported in Mentor QuestaSim
        
        // arr_x[0:2] = '{7,6,5}; // Set just the first 3 elements
        // foreach (arr_x[i]) $display("arr_x[%0d] = %0d", i, arr_x[i]);

        // arr_y = '{5{8}}; // Set 5 elements to 8
        // foreach (arr_y[i]) $display("arr_y[%0d] = %0d", i, arr_y[i]);

        // arr_x = '{default:10}; // All elements to 10
        // foreach (arr_x[i]) $display("arr_x[%0d] = %0d", i, arr_x[i]);

    end

endmodule