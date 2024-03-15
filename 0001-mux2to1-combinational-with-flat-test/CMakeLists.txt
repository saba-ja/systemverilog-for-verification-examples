cmake_minimum_required(VERSION 3.10)
project(hello_world)

# Define project name and simulation file variables
set(SRC_FILE_NAME "mux2to1")

# Define a function to encapsulate the simulation commands
function(run_simulation target_name src_file)
    add_custom_target(${target_name} ALL
        COMMAND iverilog -o ${CMAKE_BINARY_DIR}/sim.vvp -Wall -Winfloop -Wno-timescale -gno-shared-loop-index -g2012 -s ${src_file}_tb ${CMAKE_SOURCE_DIR}/${src_file}.sv ${CMAKE_SOURCE_DIR}/${src_file}_tb.sv
        COMMAND vvp ${CMAKE_BINARY_DIR}/sim.vvp
    )
endfunction()

# Use the function for the sim target
run_simulation(sim ${SRC_FILE_NAME})
