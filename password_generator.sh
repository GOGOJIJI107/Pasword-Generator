#!/bin/bash
# ===============================================
# Random Password Generator Script
# Author: Bhanu Pratap
# Description: Generates a secure random password
# ===============================================

# Function to generate a random password
generate_password() {
    local LENGTH=$1
    if [[ -z "$LENGTH" ]]; then
        LENGTH=12  # Default length
    fi

    # Define all possible characters
    local CHAR_SET='A-Za-z0-9!@#$%^&*()_+=-{}[]<>?'

    # Generate the password using /dev/urandom
    PASSWORD=$(cat /dev/urandom | tr -dc "$CHAR_SET" | head -c "$LENGTH")

    echo "Generated Password: $PASSWORD"
}

# ===============================================
# Main script execution
# ===============================================

echo "-----------------------------------------------"
echo "        RANDOM PASSWORD GENERATOR"
echo "-----------------------------------------------"
read -p "Enter desired password length: " LENGTH

generate_password "$LENGTH"

echo
echo "✅ Password generated successfully!"
echo "💡 Tip: You can redirect output to a file, e.g. ./random_password.sh > password.txt"
