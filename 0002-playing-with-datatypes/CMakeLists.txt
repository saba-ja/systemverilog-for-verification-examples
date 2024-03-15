cmake_minimum_required(VERSION 3.10)
project(data_types)

# Define project name and simulation file variables
set(PROJ_NAME "data_types")
set(SIM_FILE "simulation")

# Define a function to encapsulate the simulation commands
function(run_simulation target_name sim_file)
    add_custom_target(${target_name} ALL
        COMMAND ${CMAKE_COMMAND} -E echo "Simulating ${PROJ_NAME}_tb..."
        COMMAND iverilog -o ${CMAKE_BINARY_DIR}/${sim_file}.vvp -Wall -Winfloop -Wno-timescale -gno-shared-loop-index -g2012 ${CMAKE_SOURCE_DIR}/${PROJ_NAME}_tb.sv
        COMMAND vvp ${CMAKE_BINARY_DIR}/${sim_file}.vvp
    )
endfunction()

# Use the function for the sim target
run_simulation(sim ${SIM_FILE})
