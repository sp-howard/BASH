#!/bin/bash

# Backup Directory w/ Rotation (Retain Last 3 Backups)

# Checks if only 1 argument is passed
if [ $# -ne 1 ]
then
    echo "This script requires exactly one directory path passed to it."
    echo "Please try again."
    exit 1
fi

# Check to see if rsync is installed
if ! command -v rsync > /dev/null 2>&1
then
    echo "This script requires rsync to be installed"
    echo "Please use your distro's package manager to install rysnc and try again."
    exit 2
fi

# Checks if backup and log folder exist
if [ ! -d "backups" ];
then
    mkdir "backups"
fi

if [ ! -d "backups/logs" ];
then
    mkdir "backups/logs"
fi

# Capture the current date and store it in YYYY-MM-DD format
current_date=$(date +%Y-%m-%d_%H-%M-%S)

# Set the first argument as the directory to be backed up
directory=$1

# Set backup destination
destination="./backups/$1-$current_date"

# With dry-run for testing
# rsync_options="-avb --backup-dir ./Backups --delete --dry-run"

# Without dry run
rsync_options="-avb"

# Backup command
$(which rsync) $rsync_options $directory $destination >> ./backups/logs/$1-$current_date.log

# Keep the 3 latest backups. Gets a list of directories, excluding the three most recent, and deletes them. 
for backup_dir in $(ls ./backups | sort | head -n -3);
do
    # prevent log folder from being removed
    if [ $backup_dir != "logs" ]
    then
        rm -rf "./backups/$backup_dir"
    fi
done