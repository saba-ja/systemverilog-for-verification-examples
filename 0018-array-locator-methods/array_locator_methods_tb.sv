module array_locator_methods();
    int f[6] = '{1,6,2,6,8,6};  // Fixed-size array
    int d[] = '{2,4,6,8,10};    // Dynamic array
    int q[$] = {1,3,5,7};       // Queue
    int tq[$];                  // Temporary queue for result

    initial begin
         tq = q.min();          // {1}
         $display("q.min = %p", tq); 
         tq = d.max();
         $display("q.max = %p", tq); // {10}
         tq = f.unique();
         $display("q.unique = %p", tq);  // {1, 2, 6, 8}
    end

endmodule
