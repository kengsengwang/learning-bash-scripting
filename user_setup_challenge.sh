#!/usr/bin/env bash

# ==============================================================================
# SECTION 1: Positional Argument Check & Interactive Prompting
# ==============================================================================
# Assign initial variables from command-line arguments if provided
username=$1
userid=$2

# Prompt for username if not provided via argument
if [[ -z $username ]]; then
    read -p "Enter desired username (alphanumeric only): " username
fi

# Validate username loop (ensure it isn't empty and is alphanumeric)
while [[ ! $username =~ ^[a-zA-Z0-9]+$ ]]; do
    read -p "Invalid username. Please enter alphanumeric characters only: " username
done

# ==============================================================================
# SECTION 2: Interactive Prompt with Default Value & Input Loop Validation
# ==============================================================================
# Prompt for userid if not provided via argument
if [[ -z $userid ]]; then
    # We use 'read -p' to ask for a 4-digit ID, offering '1001' as a visual default guidance
    read -p "Enter 4-digit User ID [default: 1001]: " userid
    
    # If the user simply hit Enter (empty string), assign the default value
    if [[ -z $userid ]]; then
        userid="1001"
    fi
fi

# Ensure the User ID is exactly 4 digits long using regex matching
until [[ $userid =~ ^[0-9]{4}$ ]]; do
    read -p "Error: ID must be exactly a 4-digit number (e.g., 1001): " userid
done

# ==============================================================================
# SECTION 3: Confirmation Response
# ==============================================================================
echo "--- Account Configuration Summary ---"
echo "Username configured : $username"
echo "User ID assigned    : $userid"
echo "Status              : Setup successfully completed!"
