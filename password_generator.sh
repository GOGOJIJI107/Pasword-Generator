#!/bin/bash
# ===============================================
# Random Password Generator Script
# Author: Bhanu Pratap
# Description: Generates a secure random password
# ===============================================

generate_password() {
    local LENGTH=$1

    # Default length = 12 if not provided or invalid
    if ! [[ "$LENGTH" =~ ^[0-9]+$ ]] || [ "$LENGTH" -le 0 ]; then
        LENGTH=12
    fi

    # Use tr safely — exclude confusing characters
    local CHAR_SET='A-Za-z0-9!@#$%^&*()_+=-{}[]<>?'

    # Generate password
    local PASSWORD
    PASSWORD=$(tr -dc "$CHAR_SET" < /dev/urandom | head -c "$LENGTH")

    # If password generation fails (e.g., empty), fallback
    if [ -z "$PASSWORD" ]; then
        echo "Error: Could not generate password."
        exit 1
    fi

    echo "$PASSWORD"
}

# ===============================================
# Main Execution
# ===============================================

read -p "Enter desired password length (default 12): " LENGTH
PASSWORD=$(generate_password "$LENGTH")

echo "Generated Password: $PASSWORD"
