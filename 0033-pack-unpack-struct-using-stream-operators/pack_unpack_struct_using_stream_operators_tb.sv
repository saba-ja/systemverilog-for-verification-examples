module pack_unpack_struct_using_stream_operator_tb();
    typedef struct {
        int a;
        byte b;
        shortint c;
        int d;
    } my_struct_s;
    
    my_struct_s st;
    
    byte b[];

    initial begin
        st = '{32'hAAAA_AAAA,
                8'hBB,
                16'hCCCC,
                32'hDDDD_DDDD       
        };

      // st = {a:aaaaaaaa, b:bb, c:cccc, d:dddddddd}
      $display("st = {a:%h, b:%h, c:%h, d:%h}", st.a, st.b, st.c, st.d );
      
        // convert from struct to byte array
        b = { >> {st}};
      $display("b = %h", b); // b = aa aa aa aa bb cc cc dd dd dd dd

        // Convert from byte array to a struct

        b = '{8'h11, 8'h22, 8'h33, 8'h44, 8'h55, 8'h66, 8'h77,
              8'h88, 8'h99, 8'hAA, 8'hBB};
		
      $display("b = %h", b); // b = 11 22 33 44 55 66 77 88 99 aa bb
      
        st = { >> {b}}; // st = {a:11223344, b:55, c:6677, d:8899aabb}
        $display("st = {a:%h, b:%h, c:%h, d:%h}", st.a, st.b, st.c, st.d );
    end
endmodule