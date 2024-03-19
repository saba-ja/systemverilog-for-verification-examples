module scoreboard_with_array_locator_methods_tb();
    typedef struct packed {
        bit [7:0] addr;
        bit [7:0] pr;
        bit [15:0] data;
    } Packet;

    Packet scoreboard[$];

    function void check_addr(bit [7:0] addr);
        int intq[$];

        intq = scoreboard.find_index() with (item.addr == addr);
        case (intq.size())
            0: 
                $display("Addr %h not found in scoreboard", addr);
            1: 
                scoreboard.delete(intq[0]);
            default:
                $display("Error: Multiple hits for addr %h", addr);
        endcase
    endfunction : check_addr

initial begin
    // Initialize scoreboard with test packets
    scoreboard.push_back('{addr: 8'hAA, pr: 8'h01, data: 16'hDEAD});
    scoreboard.push_back('{addr: 8'hBB, pr: 8'h02, data: 16'hBEEF});
    scoreboard.push_back('{addr: 8'hCC, pr: 8'h03, data: 16'hCAFE});
    scoreboard.push_back('{addr: 8'hDD, pr: 8'h04, data: 16'hFACE});
    scoreboard.push_back('{addr: 8'hAA, pr: 8'h05, data: 16'hFEED}); // Duplicate address for testing

    // Test check_addr function
    $display("Initial scoreboard contents:");
    foreach(scoreboard[i]) 
        $display("Addr: %h, PR: %h, Data: %h", 
                 scoreboard[i].addr, 
                 scoreboard[i].pr, 
                 scoreboard[i].data);

    // Check for an address that exists once
    $display("\nChecking for address 0xBB...");
    check_addr(8'hBB); // Should delete this entry

    // Check for an address that doesn't exist
    $display("\nChecking for address 0x01...");
    check_addr(8'h01); // Should display not found message

    // Check for an address that exists more than once
    $display("\nChecking for address 0xAA...");
    check_addr(8'hAA); // Should display multiple hits error

    // Display remaining scoreboard contents
    $display("\nScoreboard contents after checks:");
    foreach(scoreboard[i]) 
        $display("Addr: %h, PR: %h, Data: %h", 
            scoreboard[i].addr, 
            scoreboard[i].pr, 
            scoreboard[i].data);
end

endmodule