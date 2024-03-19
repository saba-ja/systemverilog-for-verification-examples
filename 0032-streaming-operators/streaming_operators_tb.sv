module streaming_operators_tb();
    int h;
    bit [7:0] b;
    bit [7:0] c;
    bit [7:0] g[4];
    bit [7:0] j[4];
    bit [7:0] q;
    bit [7:0] r;
    bit [7:0] s;
    bit [7:0] t;

    bit [15:0] wq[$];
    bit [7:0] bq[$];

    initial begin
        j = '{8'hA, 8'hB, 8'hC, 8'hD};
        $display("j = %p", j); // j = '{10, 11, 12, 13}
        
        h = { >> {j}};  // pack array into int
        $display("h = %h", h); // h = 0a0b0c0d

        h = { << {j}}; // reverse bits
        $display("h = %h", h); // h = b030d050

        h = { << byte {j}}; // revrse bytes
        $display("h = %h", h); // h = 0d0c0b0a

        {>>{g}} = { << byte {j}}; // unpack init array
        $display("h = %p", g); // h = '{13, 12, 11, 10}

        b = { << {8'b001_0101}}; // reverse bits
        $display("h = %b", b); // h = 10101000
        
        b = { << 4 {8'b001_0101}}; // reverse nibble
        $display("h = %b", b); // h = 01010001

        {>> {q,r,s,t}} = j; // Scatter j into bytes
        $display("q = %h, r = %h, s = %h, t = %h", q, r, s, t); // q = 0a, r = 0b, s = 0c, t = 0d

        h = {>>{t, s, r, q}}; // Gather bytes into h
        $display("h = %h", h); // h = 0d0c0b0a

        wq = {16'h1234, 16'h5678};
        $display("wq = 16'h%h 16'h%h", wq[0], wq[1]); // wq = 16'h1234 16'h567

        bq = { >> {wq}}; // Convert word array to byte
        $display("bq = {%h %h %h %h}", bq[0], bq[1], bq[2], bq[3]); // bq = {12 34 56 78}

        bq = {8'h98, 8'h76, 8'h54, 8'h32};
        wq = { >> {bq}}; // Convert back bytes to half words
        $display("wq = 16'h%h 16'h%h", wq[0], wq[1]);

    end
endmodule