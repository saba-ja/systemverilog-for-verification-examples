module default_function_arguments_tb();

    function automatic void print_csm(
        const ref bit [31:0] a[],
        input bit [31:0] low = 0,
        input int high = -1);

        bit [31:0] checksum = 0;
        if (high == -1 || high >= a.size())
            high = a.size() - 1;
        
        for (int i=low; i <= high; i++)
            checksum ^= a[i];
        $display("The array checksum is %h", checksum);
    endfunction

    initial begin

        // Declare and initialize an array of 32-bit integers
        bit [31:0] a[];


      a = '{
            32'hDEAD_BEEF, 
            32'hCAFE_BABA, 
            32'hBAFF_CAFF
            };

        print_csm(a); // Checksum a[0:size()-1] default // The array checksum is aeacceaa
        print_csm(a, 2, 4); // Checksum a[2:4] // The array checksum is baffcaff
        print_csm(a, 1); // Checksum start a 1 // The array checksum is 70017045
        print_csm(a,,2); // Checksum a[0:2] // The array checksum is aeacceaa
        print_csm(); // Compiler error: a has no default value
    end
endmodule