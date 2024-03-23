`timescale 1ns/100ps

module ps;
    realtime rtdelay = 800ps; // Stored as 0.8 (800ps)
  	time tdelay = 800ps; // Rounded to 1ns (1000ps)

  initial begin
    $timeformat(-12, 0, "ps", 5);
        #rtdelay;  // Delay of 800 ps
        $display("%t", rtdelay);
        #tdelay; // Delay another 1ns
        $display("%t", tdelay);
    end
endmodule
`timescale 1ns/1ns // Reset to default