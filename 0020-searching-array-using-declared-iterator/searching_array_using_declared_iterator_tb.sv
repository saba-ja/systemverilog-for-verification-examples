module searching_array_using_declared_iterator_tb();

    int d[] = '{9,1,8,3,4,4};
    int tq[$];

    initial begin
        
        // These are all equivalent
        // Note if you do not provide the iteretor name the default iterator name is item
        tq = d.find_first with (item == 4);
        $display("d.find_first with (item == 4) = %p", tq);

        tq = d.find_first() with (item == 4);
        $display("d.find_first() with (item == 4) = %p", tq);

        tq = d.find_first(item) with (item == 4);
        $display("d.find_first(item) with (item == 4) = %p", tq);

        tq = d.find_first(x) with (x == 4);
        $display("d.find_first(x) with (x == 4) = %p", tq);
    
    end
endmodule