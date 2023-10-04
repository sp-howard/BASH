#!/bin/bash

# Check to make sure user has enetred exactly two arguments
if [ $# -ne 2 ]
then
    echo "Usage: backup.sh <source_directory> <target_directory>"
    echo "Please trey again."
    exit 1
fi

# Check to see if rsync is installed
if ! command -v rsync > /dev/null 2>&1
then
    echo "This script requires rsync to be installed"
    echo "Please use your distro's package manager to install rysnc and try again."
    exit 2
fi

# Capture the current date and store it in YYYY-MM-DD format
current_date=$(date +%Y-%m-%d)

rsync_options="-avb --backup-dir $2/current_date --delete --dry-run"

$(which rsync) $rsync_options $1 $2/current >> backup_$current_date.log

