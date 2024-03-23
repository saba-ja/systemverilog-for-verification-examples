interface bidir_if (input bit clk);
    wire [7:0] data; // Bidirectional signal
	bit drive_enable;
  
    clocking cb @(posedge clk);
        inout data;
        input drive_enable;
    endclocking

    modport TEST (clocking cb);
endinterface

program automatic test(bidir_if mif);
    initial begin
        mif.cb.data <= 'z;       // Tri-state the bus
        @mif.cb;
        $displayh(mif.cb.data);  // Read from the bus
        @mif.cb;
        mif.cb.data <= 7'h5a;    // Drive the bus
        @mif.cb;
        $displayh(mif.cb.data); // Read from the bus
        mif.cb.data <= 'z;       // Release the bus
    end
endprogram : test

module bus_tb (bidir_if mif);
  always @(posedge mif.clk) begin
        if (mif.cb.drive_enable) begin
             mif.cb.data <= 8'hA5;
        end else begin
            mif.cb.data <= 'z; // High-Z state when not driving
        end
    end
endmodule


module top_tb;
    bit clk = 0;
    bit drive_enable = 0;

    // Generate clock
    always #5 clk = ~clk; // 100MHz clock

    // Instantiate the interface
    bidir_if mif(clk);

    // Instantiate the bus module
    bus_tb  bus(mif);

    // Instantiate the test program
    test t(mif);

    initial begin
        // Initial setup
        #10; // Wait for system to stabilize
        drive_enable = 1; // Enable driving after some time
        #100; // Run simulation for a while
        drive_enable = 0; // Stop driving the bus
        #50; // Continue simulation
        $finish; // End simulation
    end
endmodule
