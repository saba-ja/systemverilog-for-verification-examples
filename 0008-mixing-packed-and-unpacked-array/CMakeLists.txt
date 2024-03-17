cmake_minimum_required(VERSION 3.10)

# Define project name
set(PROJ_NAME "mixing_packed_and_unpacked_array")

project(${PROJ_NAME})

# simulation file variables
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
