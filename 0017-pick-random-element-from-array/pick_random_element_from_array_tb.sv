module pick_random_element_from_array_tb();
    // Declare and initialize associative array with 7 elements
    int aa[int] = '{0:1, 5:2, 10:4, 15:8, 20:16, 25:32, 30:64};

    int idx;
    int element;
    int count;

    initial begin
        element = $urandom_range(aa.size()-1);    
        foreach (aa[i])
            if(count++ == element) begin
                idx = i; // Save the associateive array index
                break;
            end
        $display("element#%0d aa[%0d] = %0d", element, idx, aa[idx]);
    end
    
endmodule