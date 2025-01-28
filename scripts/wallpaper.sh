#!/bin/bash

# Define the program name and file/folder path
program_name="wallpaper"
file_or_folder="$HOME/Pictures/wallpaper"
file_or_folder_backup="$HOME/Pictures/wallpaper_backup/wallpaper"

# Check if the file or folder exists
if [ -e "$file_or_folder" ]; then
    echo "Backing up existing $file_or_folder..."

    # Ensure the backup directory exists
    mkdir -p "$HOME/Pictures/wallpaper_backup"

    sudo mv -f "$file_or_folder" "$file_or_folder_backup"
fi

# Create the directory if it doesn't exist
if [ ! -d "$file_or_folder" ]; then
    mkdir -p "$file_or_folder"
fi

# Stow the program configuration
sudo stow --target="$file_or_folder" $program_name