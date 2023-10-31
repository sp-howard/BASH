#!/bin/bash

# Backup Directory w/ Rotation (Retain Last 3 Backups)

# Checks if 2 arguments are passed
if [ $# -ne 2 ]
then
    echo "This script requires exactly two directory paths passed to it."
    echo "1 = Source, 2 = Destination"
    echo "Please try again."
    exit 1
fi

# Check if rsync is installed
if ! command -v rsync > /dev/null 2>&1
then
    echo "This script requires rsync to be installed"
    echo "Please use your distro's package manager to install rysnc and try again."
    exit 2
fi

# Capture the current date and store it in YYYY-MM-DD format
current_date=$(date +%Y-%m-%d_%H-%M-%S)

# Set the first argument as the directory to be backed up
source=$1

# Set backup destination
destination="$2/backups/$1-$current_date"

# Check if backup and log folder exist
if [ ! -d "$2/backups" ];
then
    mkdir "$2/backups"
fi

if [ ! -d "$2/backups/logs" ];
then
    mkdir "$2/backups/logs"
fi

# Options with dry-run for testing
# rsync_options="-avb --backup-dir ./Backups --delete --dry-run"

# Options without dry run
rsync_options="-avb"

# Backup command
$(which rsync) $rsync_options $source $destination >> $2/backups/logs/$1-$current_date.log

# Keep the 3 latest backups. Gets a list of directories, excluding the three most recent, and delete them. 
for backup_dir in $(ls $2/backups/ | sort | head -n -4);
do
    # Prevent log folder from being removed
    if [ $backup_dir != "logs" ]
    then
        rm -rf "$2/backups/$backup_dir"
    fi
done