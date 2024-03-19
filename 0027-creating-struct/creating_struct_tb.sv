module creating_struct_tb();
    
    // The problem with the preceding declaration is that it creates a single pixel of this type.
    struct {
        bit [7:0] r;
        bit [7:0] g;
        bit [7:0] b;
    } pixel;

    // Better way of defining struct

    typedef struct {
        bit [7:0] r;
        bit [7:0] g;
        bit [7:0] b;
    } pixel_s;

    pixel_s pxl;

    initial begin
        pxl = '{
            8'hDE,
            8'hAD,
            8'hBE
        };

        $display("pxl.r = %0x , pxl.g = %0x, pxl.b = %0x", pxl.r, pxl.g, pxl.b);
    end

endmodule