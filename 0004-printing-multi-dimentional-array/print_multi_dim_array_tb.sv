module print_multi_dim_array_tb();

    // 2.13
    initial begin
        byte array_2d[4][6];
        foreach (array_2d[i,j])
            array_2d[i][j] = i + j;
        
        foreach (array_2d[i]) begin
            $write("%2d: ", i); // Write does not add a new line
            foreach(array_2d[,j]) begin
                $write("%3d", array_2d[i][j]);
            end
            $display; // Add a new line after each row using $display
        end
    end
endmodule