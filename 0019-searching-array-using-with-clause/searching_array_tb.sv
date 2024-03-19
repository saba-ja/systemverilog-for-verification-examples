module searching_array_tb();
    int d[] = '{9,1,8,3,4,4};
    int tq[$];

    initial begin
        // Find all elements greter than 3
        tq = d.find with (item > 3);
        $display("d.find with (item > 3) = %p", tq);
        tq.delete();
        
        // Equivalent code
        foreach(d[i])
            if(d[i] > 3)
                tq.push_back(d[i]);

        $display("d (item > 3) using foreach = %p", tq);
        tq.delete();

        tq = d.find_index with (item > 3);         // {0,2,4,5}
        $display("d.find_index with (item > 3) = %p", tq);
        tq = d.find_first with (item > 99);        // {} - none found
        $display("d.find_first with (item > 99) = %p", tq);
        tq = d.find_first_index with (item == 8);  // {2} d[2] = 8
        $display("d.find_first_index with (item == 8) = %p", tq);
        tq = d.find_last with (item == 4);         // {4}
        $display("d.find_last with (item == 4) = %p", tq);
        tq = d.find_last_index with (item == 4);   // {5} d[5] = 4
        $display("d.find_last_index with (item == 4) = %p", tq);

    end
endmodule