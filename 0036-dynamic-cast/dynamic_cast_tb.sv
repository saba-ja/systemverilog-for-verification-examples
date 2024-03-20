module dynamic_cast_tb();
    typedef enum {RED, BLUE, GREEN} color_e;
    color_e color;
    color_e c2;
    int c;
	int result;
  
    initial begin
        color = BLUE;  // Set to know good value 1

        c = color; // Set c to be 1

        c++;  // Increment int to 2

        if (!$cast(color, c)) // Cast int back to enum
            $display("Cast failed for c=%0d", c);
        $display("Color is %0d / %s", color, color.name());
        
        c++; // 3 is out-of-bounds for enum
        c2 = color_e'(c);

      $display("c2 is %0d / '%0s'", c2, c2.name);
      // Dyncamic casting with $cast will return 0 since c is out of bound for enum color_e.
      $display("Cast result = %0s", $cast(c2, c)? "successful": "failed");
      

    end
endmodule