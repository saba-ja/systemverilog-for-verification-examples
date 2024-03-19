module associative_array_tb();
    byte assoc[byte];
    byte idx = 1;

    initial begin
         // Initialize widely scattered values
         do begin
            assoc[idx] = idx;
            idx = idx << 1;
         end while (idx != 0);

         // Step throug all index values with foreach
         // A simple for loop cannot step through them; you need to use a foreach loop.
         foreach (assoc[i])
            $display("assoc[%h] = %h", i, assoc[i]);

        // Step through all index values with functions
        // If you want fi ner control, you can use the fi rst and next functions in a do…while loop.
        if (assoc.first(idx)) // Get first index
            do
                $display("assoc[%h] = %h", idx, assoc[idx]);
            while(assoc.next(idx)); // Get next index

        // Find and delete the first element
        // The first method typically returns a boolean indicating whether the operation was successful and sets the argument 
        // Here we are descarding the return value by casting to void'()
        void'(assoc.first(idx));
        void'(assoc.delete(idx));
        $display("The array now has %0d elelments", assoc.num());
    end
endmodule