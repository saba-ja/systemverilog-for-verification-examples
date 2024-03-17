module packed_array_tb();

	initial begin
    // This is an array of 4 elements each element 8 bits
    // So you can think about it like 4 bytes packed into 32-bits  
    //  byte[3]          byte[2]          byte[1]          byte[0]
    // |7,6,5,4,3,2,1,0||7,6,5,4,3,2,1,0||7,6,5,4,3,2,1,0||7,6,5,4,3,2,1,0|
    bit [3:0][7:0] bytes;

    bytes = 32'hBEEF_CAFE;

    $displayh("bytes = %p", bytes); // This will show all 32-bits
    $displayh("bytes[3] = %p", bytes[3]); // This will show most signeficant byte only "BE"
    $displayh("bytes[3][7] = %p", bytes[3][7]); // This will show bit 7 of most significant byte "BE"

  end

endmodule