module mux2to1(
    input logic in0,
    input logic in1,
    input logic sel,
    output logic out
);

    always_comb begin : mux2to1_block
        if (sel == 0) begin
            out = in0;
        end else begin
            out = in1;
        end
    end

endmodule;