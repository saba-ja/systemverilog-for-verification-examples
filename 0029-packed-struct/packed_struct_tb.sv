module packed_struct_tb();
    typedef struct packed {
        bit [7:0] r;
        bit [7:0] g;
        bit [7:0] b;
    } pixel_p_s;

    typedef struct {
        bit [7:0] r;
        bit [7:0] g;
        bit [7:0] b;
    } pixel_u_s;


    pixel_p_s pxl_p;
    pixel_p_s pxl_u;

    initial begin
        // Initialize packed struct
        pxl_p.r = 8'hFF;
        pxl_p.g = 8'h00;
        pxl_p.b = 8'hFF;
        
        // Display packed struct values R=ff, G=00, B=ff
        $display("Packed Pixel: R=%h, G=%h, B=%h", pxl_p.r, pxl_p.g, pxl_p.b);

        // Initialize unpacked struct
        // Unpacked Pixel: R=cc, G=aa, B=cc
        pxl_u.r = 8'hCC;
        pxl_u.g = 8'hAA;
        pxl_u.b = 8'hCC;

        // Display unpacked struct values
        $display("Unpacked Pixel: R=%h, G=%h, B=%h", pxl_u.r, pxl_u.g, pxl_u.b);
    end
endmodule