module sorting_array_of_structures_tb();
    struct packed { 
        bit[7:0] r;
        bit[7:0] g; 
        bit[7:0] b;
        } c[];

    initial begin
        c = '{ 
            '{r:7, g:4, b:9},
            '{r:3, g:2, b:9},
            '{r:5, g:2, b:1}
            };
        
        c.sort() with (item.r); // sort using r only
        $display("sort using r only  = %p", c); // '{'{r:3, g:2, b:9}, '{r:5, g:2, b:1}, '{r:7, g:4, b:9}}

        c.sort(x) with ({x.g, x.b}); // Sort g first then b
        $display("Sort g first then b  = %p", c); // '{'{r:5, g:2, b:1}, '{r:3, g:2, b:9}, '{r:7, g:4, b:9}}
    end
endmodule