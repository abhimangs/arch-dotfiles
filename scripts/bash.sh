#!/bin/bash

# Define the program name and file/folder path
program_name="bash"
file_or_folder="$HOME/.bashrc"
file_or_folder_backup="$HOME/bash_backup/.bashrc"

# Check if the file or folder exists
if [ -e "$file_or_folder" ]; then
    echo "Backing up existing $file_or_folder..."

    # Ensure the backup directory exists
    mkdir -p "$HOME/bash_backup"

    sudo mv -f "$file_or_folder" "$file_or_folder_backup"
fi

# Stow the program configuration
sudo stow --target="$HOME" $program_name
