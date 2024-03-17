module using_dynamic_arrays_tb();

  int arr_dyn1[];
  int arr_dyn2[];

  initial begin
    arr_dyn1 = new[5]; // Allocate 5 elements
    
    foreach(arr_dyn1[j]) // Initialize the elements
      arr_dyn1[j] = j;
    
    $display("arr_dyn1 = %p", arr_dyn1);

    // Copy dynamic array
    arr_dyn2 = arr_dyn1;

    // Change the last element of the array
    arr_dyn2[4] = 10;
    $display("arr_dyn2 = %p", arr_dyn2);
    
    // Display array elements
    $display("arr_dyn1[4] = %d, arr_dyn2[4] = %d", arr_dyn1[4], arr_dyn2[4]);

    arr_dyn1 = new[20] (arr_dyn1); // Allocate 20 ints and copy from the old array
    $display("arr_dyn1 size is now %d. Values are: %p", $size(arr_dyn1), arr_dyn1);

    arr_dyn2 = new[10]; // Allocate 10 new ints but do not copy. Old values are lost
    $display("arr_dyn2 size is now %d. Values are: %p", $size(arr_dyn2), arr_dyn2);

    $display("Delete dynamic arrays");
    arr_dyn1.delete();
    arr_dyn2.delete();
    
  end

endmodule