#!/bin/bash

# Initialize metrics
CPU=0
MEM=0
DSK=0
process_name=""

# Get CPU usage
cpu_usage() {
    CPU=$(top -bn 1 | grep '%Cpu' | awk -v OFS=',' '{sum = $2 + $4 + $6 + $12 + $14; printf("%.2f%", sum)}')
}

# Get memory usage
memory_usage() {
    MEM=$(free | grep 'Mem:' | awk '{used_plus_buffers = $3 + $6; percentage = used_plus_buffers / $2 * 100.0; printf("%.2f%%", percentage)}')
}

# Get disk space usage
disk_usage() {
    DSK=$(df --exclude-type=tmpfs --exclude-type=devtmpfs --output=used,avail | awk 'NR>1 {used+=$1; avail+=$2} END {total=used+avail; printf("%.2f%", used/total*100)}')
}

show_metrics() {

    # Display metrics
    cpu_usage
    memory_usage
    disk_usage
    
    # Restore cursor position and clear to the end of screen
    clear
    echo "---- System Metrics ----"
    echo "CPU Usage:  $CPU"
    echo "Mem Usage:  $MEM"
    echo "Disk Space: $DSK"
    
    # Leave the cursor below the metrics for user input
    echo
    echo "Press Enter to Refresh"
    echo "1. Back to Main Menu"
    echo "2. Exit"

}

show_process() {

    read -p "Enter process name to monitor: " process_name
    clear

    if systemctl is-active --quiet $process_name; then
        echo "$process_name is running."
    else
        echo "$process_name is not running."
    fi

    # Leave the cursor below the metrics for user input
    echo
    echo "1. Attempt to Start Process"
    echo "2. Monitor Different Process"
    echo "3. Back to Main Menu"
    echo "4. Exit"

}

restart_process() {
    # Attempt to restart the process 3 times
    clear
    for attempt in {1..3}; do

        echo "Attempting to start process, "$process_name". Attempt $attempt of 3"
        sleep 1
        systemctl start $process_name >> /dev/null 2>&1
        sleep 1

        if systemctl is-active --quiet $process_name; then
            echo "$process_name is running."
            break
        else
            echo "$process_name could not be started."
            sleep 1
        fi

        # 5 second countdown between each restart attempt
        for countdown in {5..1};
        do
            echo -ne "\r$countdown"
            sleep 1
        done
    done

    # Leave the cursor below the metrics for user input
    echo
    echo "1. Attempt to Start Process"
    echo "2. Monitor Different Process"
    echo "3. Back to Main Menu"
    echo "4. Exit"
}

main_menu() {
    while true; do
        clear
        echo "-----   Metrics Monitor   -----"
        echo "1. View System Metrics"
        echo "2. Monitor a Process"
        echo "3. Exit"
        echo
        
        read -p "Please select an option: " input

        case $input in
            1) 
                show_metrics
                while true; do
                    read input
                    case $input in
                        "1")
                            break
                            ;;
                        "2")
                            exit 0
                            ;;
                        *)
                            show_metrics
                            ;;
                    esac
                done
                ;;
            2) 
                show_process
                while true; do
                    read input
                    case $input in
                        "1")
                            restart_process
                            ;;
                        "2")
                            show_process
                            ;;
                        "3")
                            break
                            ;;
                        "4")
                            exit 0
                            ;;
                        *)
                            echo "Error: Invalid option. Please choose a valid option (1, 2, 3, or 4)"
                            ;;
                    esac
                done
                ;;
            3) 
                echo "Exiting script."
                exit 0
                ;;
            *) 
                echo "Error: Invalid option. Please choose a valid option (1, 2, or 3)"
                ;;
        esac
    done
}

# Start the main menu
main_menu