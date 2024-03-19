module array_aggregation_tb();
    int count;
    int total;
    int d[] = '{9, 1, 8, 3, 4, 4};

    initial begin
        // Note: casting to int is needed to perform aggregation of boolean values
        count = d.sum(x) with (int'(x > 7)); // 2 = sum{1,0,1,0,0,0}
        $display("d.sum(x) with (x > 7) = %0d", count);
        
        // No casting is needed here because we are multiplying by x which will implecitly convert the bool value to integer
        total = d.sum(x) with ((x > 7) * x); // 17 = sum{9,0,8,0,0,0}
        $display("d.sum(x) with ((x > 7) * x) = %0d", total);

        count = d.sum(x) with (int'(x < 8)); // 4 = sum{0,1,0,1,1,1}
        $display("d.sum(x) with (x < 8) = %0d", count);

        total = d.sum(x) with (x < 8 ? x : 0); // 12 = sum{0,1,0,3,4,4}
        $display("d.sum(x) with (x < 8 ? x : 0) = %0d", total);

        count = d.sum(x) with (int'(x == 4)); // 2 = sum{0, 0, 0, 0, 1, 1}
        $display("d.sum(x) with (x ==4) = %0d", count);

    end
endmodule