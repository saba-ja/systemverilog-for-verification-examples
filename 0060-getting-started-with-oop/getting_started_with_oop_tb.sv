program automatic getting_started_with_oop_tb();
class Transaction;
  bit [31:0] addr;
    bit [31:0] csm;
    bit [31:0] data[8];

    function void display();
        $display("@%0t: TR addr = %h, csm=%h, data=%p", 
                  $time, addr, csm, data);
    endfunction
endclass

class PciTrans;
    bit [31:0] addr; 
    bit [31:0] data;
    function void display();
      $display("@%0t : PCI: addr=%h, data=%h", $time, addr, data);
    endfunction
endclass

Transaction t;
PciTrans pc;

initial begin
    t = new();     // Construct a Transaction
    t.display();   // Display a Transaction
    pc = new();    // Construct a PCI transaction
    pc.display();  // Display a PCI Transaction
end
endprogram