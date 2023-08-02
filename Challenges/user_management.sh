#!/bin/bash

if [ -z "$1" ]; then #Checking if the argument is empty
	# Displaying options and corresponding actions
    echo "Options:"
    echo "  -c, --create    Create a new user account"
    echo "  -d, --delete    Delete an existing user account"
    echo "  -r, --reset     Reset password for an existing account"
    echo "  -l, --list      List all user accounts on system"
    echo "  -h, --help      Display this help and exit"
elif [ "$1" = "-c" ] || [ "$1" = "--create" ]; then
	 # Creating a new user account
    echo -n "Enter the username: "
    read string
    
    # Checking if the user already exists
    if id "$string" &>/dev/null; then
        echo "User '$string' already exists. Please choose a different username."
    else
    	sudo useradd "$string"
    	echo -n "Enter "
    	sudo passwd "$string"
    	echo "User account '$string' created successfully."
    fi
elif [ "$1" = i"-d" ] || [ "$1" = "--delete" ]; then
	 # Deleting an existing user account	
    echo -n "Enter the username to delete: "
    read string
    
    # Check if the user exists before attempting to delete
    if id "$string" &>/dev/null; then
        sudo userdel "$string"
        echo "User account '$string' deleted successfully."
    else
        echo "Error: The username '$string' does not exist. Please enter valid username."
    fi
elif [ "$1" = "-r" ] || [ "$1" = "--reset" ]; then
	# Reset the password for an existing user account
    echo -n "Enter the username for password reset: "
    read string

    # Check if the user exists before resetting the password
    if id "$string" &>/dev/null; then
        sudo passwd "$string"
    	echo "Password for user '$string' has been reset successfully."
    else
        echo "Error: The username '$string' does not exist. Please enter valid username."
    fi
elif [ "$1" = "-l" ] || [ "$1" = "--list" ]; then
	 # List all user accounts on the system
    echo "List of all user accounts on the system:"
    awk -F: '{ print $1 " (UID " $3 ")" }' /etc/passwd
elif [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
	# Display help options
	echo "Options:"
    echo "  -c, --create    Create a new user account"
    echo "  -d, --delete    Delete an existing user account"
    echo "  -r, --reset     Reset password for an existing account"
    echo "  -l, --list      List all user accounts on system"
    echo "  -h, --help      Display this help and exit"
else
	echo "Invalid option"
fi
