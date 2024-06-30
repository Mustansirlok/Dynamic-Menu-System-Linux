#!/bin/bash

# Function to display the menu
show_menu() {
    echo "============================"
    echo "  Dynamic Menu System"
    echo "============================"
    echo "1. User Management"
    echo "2. Service Control"
    echo "3. Log Inspection"
    echo "4. Exit"
    echo "============================"
}

# Function for User Management
user_management() {
    echo "1. Add User"
    echo "2. Delete User"
    echo "3. List Users"
    echo "4. Back to Main Menu"
    read -p "Enter your choice [1-4]: " um_choice
    case $um_choice in
        1)
            read -p "Enter username to add: " username
            sudo adduser $username
            ;;
        2)
            read -p "Enter username to delete: " username
            sudo deluser $username
            ;;
        3)
            cut -d: -f1 /etc/passwd
            ;;
        4)
            return
            ;;
        *)
            echo "Invalid choice! Please select between 1-4."
            ;;
    esac
}

# Function for Service Control
service_control() {
    echo "1. Start Service"
    echo "2. Stop Service"
    echo "3. Restart Service"
    echo "4. Status of Service"
    echo "5. Back to Main Menu"
    read -p "Enter your choice [1-5]: " sc_choice
    case $sc_choice in
        1)
            read -p "Enter service name to start: " service
            sudo systemctl start $service
            ;;
        2)
            read -p "Enter service name to stop: " service
            sudo systemctl stop $service
            ;;
        3)
            read -p "Enter service name to restart: " service
            sudo systemctl restart $service
            ;;
        4)
            read -p "Enter service name to check status: " service
            sudo systemctl status $service
            ;;
        5)
            return
            ;;
        *)
            echo "Invalid choice! Please select between 1-5."
            ;;
    esac
}

# Function for Log Inspection
log_inspection() {
    echo "1. View Syslog"
    echo "2. View Auth Log"
    echo "3. Back to Main Menu"
    read -p "Enter your choice [1-3]: " li_choice
    case $li_choice in
        1)
            less /var/log/syslog
            ;;
        2)
            less /var/log/auth.log
            ;;
        3)
            return
            ;;
        *)
            echo "Invalid choice! Please select between 1-3."
            ;;
    esac
}

# Main script
while true; do
    show_menu
    read -p "Enter your choice [1-4]: " choice
    case $choice in
        1) user_management;;
        2) service_control;;
        3) log_inspection;;
        4) echo "Exiting..."; exit 0;;
        *) echo "Invalid choice! Please select between 1-4.";;
    esac
done

