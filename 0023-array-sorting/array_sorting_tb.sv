module array_sorting_tb();

    int d[] = '{9,1,8,3,4,4};

    initial begin
        d.reverse();                     // '{4, 4, 3, 8, 1, 9}
        $display("d.reverse = %p", d);

        d.sort();
        $display("d.sort = %p", d);     // '{1, 3, 4, 4, 8, 9}
        
        d.rsort();
        $display("d.rsort = %p", d);    // '{9, 8, 4, 4, 3, 1}

        d.shuffle();
        $display("d.shuffle = %p", d);  // '{8, 1, 4, 3, 9, 4}

    end

endmodule