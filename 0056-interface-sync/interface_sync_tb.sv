interface bus_if(input logic clk);
    logic grant;

  clocking cb @(posedge clk);
        input grant;
    endclocking

    modport TB(clocking cb);

endinterface //bus_if

program automatic test(bus_if.TB bus);
    initial begin
        @bus.cb;                                   // Continue on active edge in clocking block
      $display("@%0t: Event happened: @bus.cb", $time);
        
      repeat (2) @bus.cb;                        // Wait for 3 active edges
      $display("@%0t: Event happened: repeat (2) @bus.cb", $time);
        
        @bus.cb.grant;                             // Continue on any edge
        $display("@%0t: Event happened: @bus.cb.grant", $time);

        wait (bus.cb.grant == 1);                  // Wait for expression
                                                   // No delay if already true
        $display("@%0t: Event happened: wait (bus.cb.grant == 1)", $time);
        
        @(posedge bus.cb.grant);                   // Continue on posedge
        $display("@%0t: Event happened: @(posedge bus.cb.grant)", $time);
      	$finish;
    end
endprogram


module top;
    logic clk = 0;

    bus_if busif(clk);

    test t1(busif);
    
    always #50 clk = ~clk;
	
    initial begin
        #250;
		busif.grant = 0;
        #100
      	busif.grant = 1;
        #100
      	busif.grant = 0;
        #100
      	busif.grant = 1;
        #100
      	busif.grant = 0;
    end
endmodule : top
