#!/bin/bash

# userman provides a set of tools for user account management on a UNIX-based system. This includes account creation, deletion, password reset, and listing of users.

#############
# FUNCTIONS #
#############

## Account Creation
## -c or --create

account_creation() {

    # Prompt for username if not passed to function
    if [ $# -eq 1 ]; then
        username=$1
    else
        read -p "Enter new user name: " username
    fi

    # Check if username exists in password file
    # -q sets grep to quiet mode, so that only the exit code is retreived
    if grep -q "$username" /etc/passwd; then
        echo "There is already a user named $username."
        exit 1
    fi

    useradd $username

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

    # Prompt for username if not passed to function
    if [ $# -eq 1 ]; then
        username=$1
    else
        read -p "Enter user name to delete: " username
    fi

    userdel $username

    # Check if userdel command completes
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

    # Prompt for username if not passed to function
    if [ $# -eq 1 ]; then
        username=$1
    else
        read -p "Enter user name to reset password for: " username
    fi

    passwd $username

    # Check if passwd command completes
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

# Selects accounts based on UID. This filters local user accounts from system accounts. Prints only the username field.
awk -F: -v min=$(awk '/^UID_MIN/ {print $2}' /etc/login.defs) -v max=$(awk '/^UID_MAX/ {print $2}' /etc/login.defs) '$3 >= min && $3 <= max {print $1}' /etc/passwd

}

### Display Help
### -h or --help

help() {

# nroff allows the folling man document to be displayed using the less command, which is the tradiotnal way MAN pages are viewed.
nroff -man <<MANPAGE | less
USERMAN(1)                  User Commands                  USERMAN(1)

NAME
    userman - User Management Script

SYNOPSIS
    userman [OPTIONS] [USERNAME]

DESCRIPTION
    userman provides a set of tools for user account management on a UNIX-based system. This includes account creation, deletion, password reset, and listing of users.

OPTIONS
    -c, --create [USERNAME]
        Create a new user account. If USERNAME is not provided, you will be prompted to enter it.

    -d, --delete [USERNAME]
        Delete an existing user account. If USERNAME is not provided, you will be prompted to enter it.

    -r, --reset [USERNAME]
        Reset the password for an existing user account. If USERNAME is not provided, you will be prompted to enter it.

    -l, --list
        List all user accounts.

    -h, --help
        Display this help message.

EXAMPLES
    userman -c 
        Prompts you to create a new user.

    userman --delete alice
        Deletes the user named alice.

    userman -r bob
        Resets the password for the user named bob.

    userman --list
        Lists all user accounts.

EXIT STATUS
    Returns 0 on success or 1 on failure.

AUTHORS
    Your Name <your.email@example.com>

NOTES
    Ensure you have the necessary permissions to perform user management tasks.

SEE ALSO
    useradd(8), userdel(8), passwd(1), awk(1)

Linux                           MONTH DAY, YEAR                      USERMAN(1)
MANPAGE
    exit 0

}

#############
#  OPTIONS  #
#############

# Validate options
options=$(getopt -o cdrlh --long create:,delete:,reset:,list,help  -- "$@")

# Require at least one option
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
        help
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
    --help)
        help
        ;;    
    --)
        shift
        break
        ;;
    esac
    shift
done