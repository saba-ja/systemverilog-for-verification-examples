module working_with_tasks_and_functions_tb();

    task display_add_result(input int s);
        $display("This is a message from a task");
        $display("The result of the sum is %d", s);
    endtask

    function int add(int a, int b);
        int s;
        s = a + b;
        return s;
    endfunction

    initial begin
        int result;
        result = add(4, 2);
        display_add_result(result);
    end
    
endmodule
