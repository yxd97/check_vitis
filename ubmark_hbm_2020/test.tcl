# pring all commandline arguments
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

if {[stringInList "csim" $::argv]} {
    puts "running csim"
}

if {[stringInList "csynth" $::argv]} {
    puts "running csynth"
    if {[stringInList "cosim" $::argv]} {
        puts "running cosim"
    }
} else {
    if {[stringInList "cosim" $::argv]} {
        puts "\[ERROR\] cosim requires csynth!"
    }
}


exit
