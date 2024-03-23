module using_ref_arugment_tb();

    /*
    Finally, to get to your original question, a const ref argument behaves the 
    same as a ref argument, except that the compiler will treat the formal 
    argument as read-only. There are a number of situations that require 
    functions to have no side-effects (no modification of variables outside of 
    the function except through the return value). So the LRM restricts 
    functions in this situation to only having input or const ref arguments.
    https://verificationacademy.com/forums/t/const-ref/31194/3
    */

    function automatic int calc_csm_func(const ref bit [31:0] a[]);
        bit [31:0] checksum = 0;
        for (int i = 0; i < a.size(); i++)
            checksum ^= a[i];
        return checksum;
        
    endfunction

    task automatic calc_csm_task(const ref bit[31:0] a[], output int checksum);
        checksum = 0; 
        for (int i=0; i < a.size(); i++)
            checksum ^= a[i];
    endtask

    initial begin 

        // Declare and initialize an array of 32-bit integers
        bit [31:0] my_array[];

        int result1;
        int result2;

      my_array = '{
            32'hDEAD_BEEF, 
            32'hCAFE_BABA, 
            32'hBAFF_CAFF
            };

        // Call the function with the array as an argument
        result1 = calc_csm_func(my_array); // The array checksum is aeacceaa
        $display("The array checksum is %h", result1);

        // Call the task with the array as an argument
        calc_csm_task(my_array, result2); // The array checksum is aeacceaa
        $display("The array checksum is %h", result2);

    end
endmodule