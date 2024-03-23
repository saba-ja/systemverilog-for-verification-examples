module loops_tb();

    initial begin: example
        integer array[10];
        integer sum;
        integer j;
        
        // Declare i in for statement
        for (int i=0; i < 10; i++) 
            array[i] = i;

        // Add up values in the array
        sum = array[9];
        j = 8;

        do
            sum += array[j]; // Equivalent to sum = sum + array[j]
        while(j--);  // Test if j == 0

        $display("Sum = %4d", sum); // %4d Specify width // Sum = 45

    end : example // End label
endmodule