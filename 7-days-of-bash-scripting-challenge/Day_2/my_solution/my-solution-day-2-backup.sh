#!/bin/bash
#!/bin/bash

# Backup Directory w/ Rotation (Retain Last 3 Backups)

# Checks if only 1 argument is passed
if [ $# -ne 1 ]
then
    echo "This script requires exactly one directory path passed to it."
    echo "Please try again."
    exit 1
fi

# Set the first argument as the directory to be backed up
directory=$1

# Check to see if rsync is installed
if ! command -v rsync > /dev/null 2>&1
then
    echo "This script requires rsync to be installed"
    echo "Please use your distro's package manager to install rysnc and try again."
    exit 2
fi

# Capture the current date and store it in YYYY-MM-DD format
current_date=$(date +%Y-%m-%d)

# With dry-ruin for testing
# rsync_options="-avb --backup-dir ./Backups --delete --dry-run"

# Without dry run
rsync_options="-avb --backup-dir ./backups --delete"

$(which rsync) $rsync_options $1 >> backup_$current_date.log