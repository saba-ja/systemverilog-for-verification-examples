class Transaction;
    bit [31:0] addr;
    bit [31:0] csm;
    bit [31:0] data[8];
    extern function void display();
endclass

function void Transaction::display();
  $display("@%0t: Transaction addr=%h, csm=%h, data=%p", $time, addr, csm, data);
endfunction

class PciTrans;
    bit [31:0] addr;
    bit [31:0] data;
    extern function void display();
endclass
      
function void PciTrans::display();
  $display("@%0t: PCI: addr=%h, data=%p", $time, addr, data);
endfunction

program automatic defining_method_outside_of_class_tb();
Transaction t;
PciTrans pc;

initial begin
    t = new();     // Construct a Transaction
    t.display();   // Display a Transaction
    pc = new();    // Construct a PCI transaction
    pc.display();  // Display a PCI Transaction
end
endprogram
