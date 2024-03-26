program automatic scoping_tb;
    int limit; // $root.scopting_tb.limit

    class Foo;
        int limit; // $root.scoping_tb.Foo.limit
        int array[]; 

        // $root.scoping_tb.print.limit
        function void print (input int limit);
            for (int i=0; i < limit; i++)
                $display("%m: array[%0d]=%0d", i, array[i]);
        endfunction
    endclass

    initial begin
        int limit;
        Foo bar;
        limit = 3;
        bar = new();
        bar.array = new[limit];
        bar.print(limit);
    end
endprogram