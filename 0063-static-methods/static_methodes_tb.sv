class Config; 
    int num_trans;
  
  function new(input int num_trans);
    this.num_trans = num_trans;
    $display("Constructor was called. num_trans = %0d", this.num_trans);
  endfunction
endclass

class Transaction;
    static Config cfg;
    static int count = 0;
    int id;
	
  function new(input id);
    count++;
  	this.id = id;
  endfunction
  
    // Static method to display static variables.
    static function void display_statics();
        if (cfg == null)
            $display("Error: configurration not set");
        else
            $display("Transaction cfg.num_trans=%0d, count=%0d",
            cfg.num_trans, count);
    endfunction : display_statics
endclass

program automatic static_methods_tb;

Config cfg;
  Transaction trans[];

initial begin
    cfg = new(.num_trans(42)); // Pass argument by name
    trans = new[10];
  foreach(trans[i])
    trans[i] = new(.id(i));

  Transaction::cfg = cfg;
  Transaction::display_statics(); // Static method call
end
endprogram