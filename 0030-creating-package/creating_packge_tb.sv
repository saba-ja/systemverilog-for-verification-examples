package ABC;
    parameter int abc_data_width = 32;
    typedef logic [abc_data_width-1:0] abc_data_t;
    parameter time timeout = 100ns;
    const string message = "ABC done";
endpackage

module creating_packge_tb();
    import ABC::*; // Import all ABC symbols
    abc_data_t data; // From package ABC

    initial begin
        #(timeout);
        $display("Timeout - %s", message);
        $finish;
    end
endmodule