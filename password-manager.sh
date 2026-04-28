#!/bin/bash

STORE_DIR="$HOME/my_passwords"
mkdir -p "$STORE_DIR"

while true; do
    echo "--- Simple Password Vault ---"
    echo "1. Save New Password"
    echo "2. View Existing Password"
    echo "3. List All Accounts"
    echo "4. Exit"
    read -p "Select an option: " CHOICE

    case $CHOICE in
        1)
            read -p "Enter Account Name (e.g., Google): " ACC
            read -p "Enter Password: " PASS
            echo "$PASS" > "$STORE_DIR/$ACC.txt"
            echo "Successfully saved to $STORE_DIR/$ACC.txt"
            echo
            ;;
        2)
            read -p "Which account password do you need? " ACC
            if [ -f "$STORE_DIR/$ACC.txt" ]; then
                echo -n "Password for $ACC is: "
                cat "$STORE_DIR/$ACC.txt"
            else
                echo "Error: No password file found for '$ACC'."
            fi
            echo
            ;;
        3)
            echo "Stored Accounts:"
            ls "$STORE_DIR" | sed 's/.txt//'
            echo
            ;;
        4)
            exit 0
            ;;
        *)
            echo "Invalid selection."
            echo
            ;;
    esac
done
