module associative_array_with_string_index_tb ();

int switch[string];
int min_address;
int max_address;
int file;
int fscanf_ret; // Variable to capture the return value of $fscanf

initial begin
    string s;
    int i;
    file = $fopen("switch.txt", "r");
    if (file == 0) begin
        $display("Failed to open file.");
        $finish;
    end

    while(!$feof(file)) begin
        fscanf_ret = $fscanf(file, "%d %s", i, s);
        if (fscanf_ret != 2) begin
            // Handle error or EOF
            $display("Error reading from file or EOF reached.");
            break;
        end
        switch[s] = i;
    end
    $fclose(file);

    // Get the min address
    // If string not found, use default value of 0 for int array
    min_address = switch.exists("min_address") ? switch["min_address"] : 0;

    // Get the max address.
    // Use 1000 if max_Address does not exist
    max_address = switch.exists("max_address") ? switch["max_address"] : 1000;

    // Print all switches
    foreach (switch[s])
        $display("switch['%s'] = %0d", s, switch[s]);
end
    
endmodule
