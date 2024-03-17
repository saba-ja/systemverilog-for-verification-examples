module access_bits_in_array_tb();

	initial begin
      // Here we define an array of 5 elements where each element
      // is a 32 bit value.
      bit [31:0] src[5];
      
      // repeat value 7 for 5 times to initialize the array
      src = '{5{6}};
      
      // Print the first element of the array
      $displayb("src[0] = %p", src[0]);
      // print the bit 0 which is LSB bit of the first element of the array
      $displayb("src[0][0] = %p", src[0][0]);
      // print element 0 bits 2 to 1 inclusive
      $displayb("src[0][2:1] = %p", src[0][2:1]);
    end

endmodule