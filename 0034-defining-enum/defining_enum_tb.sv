module defining_enum_tb();
    
    // A simple enum type. Not recommended
    enum {RED, BLUE, GREEN} color;

    // Enum types with typedef. Recommended style
    typedef enum {INIT, DECODE, IDLE} fsmstate_e;

    // Defining enumerated values
    typedef enum {BAD_O=0, FIRST=1, SECOND=2, THIRD=3} ordinal_e;
    original_e position;

    fsmstate_e pstate, nstate; // declare typed variables

    initial begin
        case (pstate)
            IDLE: nstate = INIT;
            INIT: nstate = DECODE;
            default: nstate = IDLE;
        endcase

        // Display symbolic state name 
        $display("Next state is %s", nstate.name()); // Next state is DECODE

        position = BAD_O;
        $display("Position is %s", position); // Position is BAD_O
    end
endmodule