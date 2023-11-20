#!/bin/bash

# This script accepts a single parameter, a process name, and checks if it is running.
# If not, it will attempt to restart the process a total of 3 times.
#
#                              Schedule with Cron
#
# With the user you'd like to run the command as, enter the command crontab -e
# The syntax for a cronjob is as follows, ex:
#
# */1 * * * * /path/monitor.sh nginx >> /path/monitor.log 2>&1
# minute hour day month weekday <command> 
#
# The example here the status of the nginx process every minute.
# 
# Make sure the user you open the crontab with has access to start processes with systemctl
#
# Open /etc/sudoers with a text editor (nano, vim)
# sudo nano /etc/sudoers
#
# Add the following line, changing the placeholder "yourusername"
# yourusername ALL=NOPASSWD: /bin/systemctl start *, /bin/systemctl stop *
#
#                            E-Mail Restart Failures
# For Ubuntu systems, run:
# sudo apt install mailutils
#
# 
#

# Check if a single aparameter was passed. If not, prompt user for process name.
if [ $# -eq 1 ]; then
    process_name=$1
else
    read -p "Enter process name to monitor: " process_name
fi

# Check if process is running
if systemctl is-active --quiet $process_name; then
    echo "$process_name is running."
    exit 0
else
    echo "$process_name is not running."

    # Attempt to restart the process 3 times
    for attempt in {1..3};
    do
        echo "Attempting to start process, "$process_name". Attempt $attempt of 3"
        sleep 1
        systemctl start $process_name >> /dev/null 2>&1
        sleep 1

        if systemctl is-active --quiet $process_name; then
            echo "$process_name is running."
            exit 0
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

        echo ""

    done

    echo "$process_name could not be started after 3 attempts. Try starting it manually."

    # Check if mailutils is installed for email notification
    if ! command -v mailutils > /dev/null 2>&1
    then
        echo "To enable email notification please install mailutils."
    fi

    echo "$process_name could not be started after 3 attempts. Try starting it manually." | mail -s "$process_name could not be started" -a "From: alert@mydomain.com" $notification_recipient

    exit 1
fi
 
 # -p --process
 # -a --alert
 # -f --alert-from
 # -t --alert-to