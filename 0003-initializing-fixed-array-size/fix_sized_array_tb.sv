module fix_sized_array_tb();

    initial begin
        int arr_x[4];
        int arr_y[5];

        localparam int ARR_SIZE = 5;

        // The following will define an array of 5 elements with each element 32 bit 
        // The index of each item is ascending (0 to 4) and the index of bits is decending (31 downto 0)
        bit [0:ARR_SIZE-1][31:0] src0;
        bit [0:ARR_SIZE-1][31:0] dst0;

        // The following generates the same 2D array as the above with a different syntax.
        // In the syntax the order of each element is declared first then the number of elements in the array
        bit [31:0] src1[ARR_SIZE];
        bit [31:0] dst1[ARR_SIZE];

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
        $display("src0 original Values:");
        for (int i=0; i < $size(src0); i++) begin
            src0[i] = i;
            $display("src0[%0d] = %0d", i, src0[i]);
        end
        
        $display("dst0 new Values:");
        foreach (dst0[i]) begin
            dst0[i] = src0[i] * 2;
            $display("dst0[%0d] = %0d", i, dst0[i]);
        end

        $display("src1 original Values:");
        for (int i=0; i < $size(src1); i++) begin
            src1[i] = i + 1;
            $display("src1[%0d] = %0d", i, src1[i]);
        end

        $display("dst1 new Values:");
        foreach (dst1[i]) begin
            dst1[i] = src1[i] * 2;
            $display("dst1[%0d] = %0d", i, dst1[i]);
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