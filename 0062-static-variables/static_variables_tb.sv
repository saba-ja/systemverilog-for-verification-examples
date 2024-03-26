class Transaction;
    static int count = 0; // Number of objects created
    int id;  // Unique instance ID

    function new();
        id = count++;
    endfunction

endclass

program automatic static_variables_tb();
    Transaction t1;
    Transaction t2;

    initial begin
        t1 = new(); // 1st instance, id = 0, count = 1
        $display("First id=%0d, count=%0d", t1.id, t1.count);
        t2 = new(); // 2nd instance, id = 1, count = 2
        $display("Second id=%0d, count=%0d", t2.id, t2.count);
    end
endprogram : static_variables_tb
