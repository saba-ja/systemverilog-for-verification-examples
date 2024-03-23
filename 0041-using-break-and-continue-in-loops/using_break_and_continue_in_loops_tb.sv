module using_break_and_continue_in_loops_tb();
    initial begin
        bit [127:0] cmd;
        int file;
        int c;

        file = $fopen("commands.txt", "r");
        if (file == 0) begin
            $display("Error: Failed to open commands.txt");
            $finish;
        end

        while (!$feof(file)) begin
            c = $fscanf(file, "%s", cmd);
            if (c == 0) begin
                $display("Error: Failed to read a command.");
                break; // Exit on read error
            end
            case(cmd)
                "": continue; // Blank line - skip to loop end
                "done": break; // Done - leave loop
                // Process other commands here
                default: $display("Command: %s", cmd); // Example command processing
            endcase
        end
        $fclose(file);
    end
endmodule
