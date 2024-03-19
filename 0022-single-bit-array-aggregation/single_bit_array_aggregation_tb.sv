module single_bit_array_aggregation_tb();

    bit one[6]; // Array of single bits
    int total;

    initial begin
        foreach (one[i]) begin
            one[i] = i;  // one[i] gets 0 or 1
            $display("one[%0d] = %0d", i, one[i]);
        end

        // Compute the single-bit sum
        total = one.sum(); // Total = 1 = (0 + 1 + 0 + 1 + 0 + 1)
        $display("total of single bit sum = %0d", total);

        // Computer with 32-bit signed arithmetic (Typo in the original book)
        total = one.sum() with (int'(item)); // total = 3
        $display("total with 32-bit signed arithmetic sum = %0d", total);

    end

endmodule