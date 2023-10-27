#!/bin/bash

## GETOPT

# Validate options
options=$(getopt -o cdrlh --long create:,delete:,reset:,list,help  -- "$@")

# Atleast one option should be used
[ $? -eq 0 ] || { 
    echo "Incorrect options provided"
    exit 1
}

eval set -- "$options"
while true; do
    case "$1" in
    -b)
        COLOR=BLUE
        ;;
    -r)
        COLOR=RED
        ;;
    -g)
        COLOR=GREEN
        ;;
    --color)
        shift; # The arg is next in position args
        COLOR=$1
        [[ ! $COLOR =~ BLUE|RED|GREEN ]] && {
            echo "Incorrect options provided"
            exit 1
        }
        ;;
    --)
        shift
        break
        ;;
    esac
    shift
done

echo "Color is $COLOR"
exit 0;


### Account Creation
### -c or --create

echo "New username:"
read ac_username

# Check if username exists in password file
# -q sets grep to quiet mode, so that only the exit code is retreived
if grep -q "$ac_username" /etc/passwd
then
    echo "There is already a user named $ac_username"
    exit 1
fi

useradd $ac_username
passwd $ac_username

echo "New user created: $ac_username"

### Account Deletion
### -d or --delete


### Password Reset
### -r or --reset


### List Accounts
### -l or --list


### Display Help
### -h or --help

