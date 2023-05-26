proc stringInList {searchString stringList} {
    set found 0
    foreach item $stringList {
        if {$searchString eq $item} {
            set found 1
            break
        }
    }
    return $found
}

# Create a project
open_project -reset hls.prj

# Add design files
add_files hbm_kernel/hbm_kernel.cpp -cflags "-std=c++1y -I./hbm_kernel"
# Add test bench & files
add_files -tb hbm_kernel/hls_tb.cpp -cflags "-std=c++1y -I./hbm_kernel"

# Set the top-level function
set_top hbm_kernel

# ########################################################
# Create a solution
open_solution -reset solution1 -flow_target vitis

# Define technology and clock rate
set_part  {xcu280-fsvh2892-2L-e}
create_clock -period 3.33

if {[stringInList "csim" $::argv]} {
    csim_design
}

if {[stringInList "csynth" $::argv]} {
    csynth_design
    if {[stringInList "cosim" $::argv]} {
        cosim_design
    }
} else {
    if {[stringInList "cosim" $::argv]} {
        puts "\[ERROR\] cosim requires csynth!"
    }
}


exit
