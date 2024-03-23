program automatic test();

    logic [31:0] bus_addr;
    logic [31:0] bus_data;

    initial begin
        bus_addr = 0;
        bus_data = 32'h11223344;

        #5; // Wait for 5 time units

        bus_addr = 32'hAABBCCDD;

        wait_for_bus(32'hAABBCCDD, 32'h11223344, success);
        $display("Address = 0xAABBCCDD, Expected Data = 0x11223344, Success = %b", success);
    end
    
    task wait_for_bus(
        input logic [31:0] addr,
        expect_data,
        output logic success);

        while(bus_addr !== addr)
            @(bus_addr);
        
        success = (bus_data == expect_data);
    endtask

endprogram

