module iterating_enum_tb();
    typedef enum {RED, BLUE, GREEN} color_e;

    color_e color;

    // You can use a do…while loop to step through all the values, checking when the value wraps around
	initial begin
  	    color = color.first;
        do begin
            $display("Color = %0d/%s", color, color.name());
            color = color.next;
        end while(color != color.first); // Done at wrap-around
    end
/* Output
    Color = 0/RED
    Color = 1/BLUE
    Color = 2/GREEN
*/

endmodule