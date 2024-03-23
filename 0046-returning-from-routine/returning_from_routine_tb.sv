module returning_from_routine_tb();
    task automatic load_array(input int len, ref int array[]);
        if(len <= 0) begin
            $display("Bad len");
            return;
        end
        $display("arr = %p", array);
    endtask

    function bit transmit(input bit [31:0] data);
        bit status;
        status = 1'b1;
        // Send transaction ...
        return status;
    endfunction

    initial begin
        int arr[];
        int len;
        bit status;
        bit [31:0] dt;

        arr = '{0,1,2,3,4,5,6,7,8,9};
        len = arr.size();
        load_array(len, arr);

        arr = '{0};
        len = arr.size();
        load_array(len, arr);

        dt = 32'hDEADBEEF;
        status = transmit(dt);
        $display("Status is %b", status);
    end
endmodule
