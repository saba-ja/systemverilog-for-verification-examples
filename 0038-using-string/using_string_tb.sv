module using_const_tb();
    string s;

    initial begin
        s = "IEEE ";
        $display(s.getc(0));
        $display(s.tolower());

        s.putc(s.len()-1, "-");
        s = {s, "1800"};
        $display("%s", s);

        $display(s.substr(2,5)); // Display EE-1

        // Create temporary string, note format
        my_log($sformatf("%s %5d", s, 42));

    end

    function void my_log(string message);
        // Pring a message to a log
        $display("@%0t: %s", $time, message);
    endfunction
endmodule