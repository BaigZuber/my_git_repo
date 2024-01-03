#!/bin/bash

# Specify the CSV file with user information
csv_file="user_list.csv"

# Check if the CSV file exists
if [[ ! -f "$csv_file" ]]
then
    echo "Error: CSV file '$csv_file' not found."
    exit 1
fi


while IFS=',' read -r username full_name password
do
    # Check if the username already exists
    if id "$username" &>/dev/null;
    then
        echo "User '$username' already exists. Skipping."
    else
        # Create the user with specified information
        useradd -m -c "$full_name" -s /bin/bash "$username"
        
        # Set the password for the new user
        echo "$username:$password" | chpasswd
        
        echo "User '$username' created successfully."
    fi
done < "$csv_file"
