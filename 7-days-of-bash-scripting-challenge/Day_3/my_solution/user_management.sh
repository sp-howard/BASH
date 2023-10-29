#!/bin/bash

#############
# FUNCTIONS #
#############

## Account Creation
## -c or --create

account_creation() {

    #Prompt for username if name is not passed to function
    if [ $# -eq 1 ]; then
        username=$1
    else
        read -p "Enter new user name. \n" username
    fi

    # Check if username exists in password file
    # -q sets grep to quiet mode, so that only the exit code is retreived
    if grep -q "$username" /etc/passwd; then
        echo "There is already a user named $username."
        exit 1
    fi

    useradd $ac_username
    # Check if useradd command completes
    if [ $? -ne 0 ]; then
        echo "Failed to add user. Try running with super user privileges."
        exit 1
    else
        passwd $username
        echo "New user created: $username"
    fi
}

### Account Deletion
### -d or --delete

account_deletion() {

    #Prompt for username if name is not passed to function
    if [ $# -eq 1 ]; then
        username=$1
    else
        read -p "Enter user name to delete.\n" username
    fi

    userdel $username
    # Check if useradd command completes
    if [ $? -ne 0 ]; then
        echo "Failed to delete user."
        exit 1
    else
        echo "User $username was deleted."
    fi
}


### Password Reset
### -r or --reset

password_reset() {

    #Prompt for username if name is not passed to function
    if [ $# -eq 1 ]; then
        username=$1
    else
        read -p "Enter user name to reset password for.\n" username
    fi

    passwd $username
    # Check if useradd command completes
    if [ $? -ne 0 ]; then
        echo "Failed to reset password for $username."
        exit 1
    else
        echo "Password for $username was reset."
    fi
}

### List Accounts
### -l or --list

list_accounts() {

awk -F: -v min=$(awk '/^UID_MIN/ {print $2}' /etc/login.defs) -v max=$(awk '/^UID_MAX/ {print $2}' /etc/login.defs) '$3 >= min && $3 <= max {print $1}' /etc/passwd

}

### Display Help
### -h or --help


############
#  GETOPT  #
############

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
    -c)
        account_creation
        ;;
    -d)
        account_deletion
        ;;
    -r)
        password_reset
        ;;
    -l)
        list_accounts
        ;;
    -h)
        echo "Help"
        ;;
    --create)
        shift; # The arg is next in position args
        account_creation $1
        [[ ! $1 ]] && {
            echo "Please provide name of user to create."
            exit 1
        }
        ;;
    --delete)
        shift; # The arg is next in position args
        account_deletion $1
        [[ ! $1 ]] && {
            echo "Please provide name of user to delete."
            exit 1
        }
        ;;
    --reset)
        shift; # The arg is next in position args
        password_reset $1
        [[ ! $1 ]] && {
            echo "Please provide name of user whose password you'd like to reset."
            exit 1
        }
        ;;
    --list)
        list_accounts
        ;;
    --)
        shift
        break
        ;;
    esac
    shift
done

exit 0;