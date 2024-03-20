`define MACRO_SUCCESS_MSG "Execution was successful using macro"

module using_const_tb();

    parameter string PARAM_SUCCESS_MSG = "Execution was successful using parameter";
    localparam string LOCALPARAM_SUCCESS_MSG = "Execution was successful using localparam";
    const string CONST_SUCCESS_MSG = "Execution was successful using const";

    initial begin
        // Using a parameter
        $display("%s", PARAM_SUCCESS_MSG);
        // Using a localparam
        $display("%s", LOCALPARAM_SUCCESS_MSG);
        // Using a macro
        $display("%s", `MACRO_SUCCESS_MSG);
        // Using a const
        $display("%s", CONST_SUCCESS_MSG);
    end
endmodule
