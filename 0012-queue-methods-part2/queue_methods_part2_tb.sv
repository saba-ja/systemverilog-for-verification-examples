module queue_methods_part2_tb();
    int j = 1;
    int q2[$] = {3, 4};
    int q[$] = {0, 2, 5};

    initial begin
        q = {q[0], j, q[1:$]}; // {0, 1, 2, 5} Inserting 1 before 2
        $display("q = %p", q);
        
        q = {q[0:2], q2, q[3:$]}; // {0, 1, 2, 3, 4, 5}
        $display("q = %p", q);
        
        q = {q[0], q[2:$]}; // {0, 2,3,4,5}
        $display("q = %p", q);

        q = {6, q}; // {6,0,2,3,4,5} Insert 6 at front
        $display("q = %p", q);
        j = q[$]; // j=5 ; pop_back equivalent
        $display("q = %p", q);        
        q = q[0:$-1]; // {6, 0, 2, 3, 4}
        $display("q = %p", q);
        q = {q, 8}; // {6,0,2,3,4,8} Insert at back
        $display("q = %p", q);
        j = q[0]; // j = 6 ; pop_front
        $display("q = %p", q);
        q = q[1:$]; // {0, 2, 3, 4, 8} pop_front equivalent
        $display("q = %p", q);
        q = {}; // delete equivalent
        $display("q = %p", q);        
    end
endmodule