program automatic test;
    int errors, warnings;

    initial begin
        // Main program
        errors <= 0;
        warnings <= 0;
    end

    final begin
        $display("-----------------------------------------------");
        $display("Test completed with %0d errors and %0d warnings", errors, warnings);
        $display("-----------------------------------------------");
    end
endprogram