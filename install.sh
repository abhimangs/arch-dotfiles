#!/bin/bash

# Define script paths
script_dir="$HOME/dotfiles/scripts"

declare -A options=(
    ["1"]="Configure Alacritty"
    ["2"]="Configure Bash"
    ["3"]="Install Fastfetch"
    ["4"]="Configure Ghostty"
    ["5"]="Set KDE Keybinds"
    ["6"]="Setup Neofetch"
    ["7"]="Configure Pacman"
    ["8"]="Setup Rofi"
    ["9"]="Install Ulauncher"
    ["10"]="Set Wallpaper"
    ["11"]="Exit"
)

declare -A scripts=(
    ["1"]="$script_dir/alacritty.sh"
    ["2"]="$script_dir/bash.sh"
    ["3"]="$script_dir/fastfetch.sh"
    ["4"]="$script_dir/ghostty.sh"
    ["5"]="$script_dir/kde-keybinds.sh"
    ["6"]="$script_dir/neofetch.sh"
    ["7"]="$script_dir/pacman.sh"
    ["8"]="$script_dir/rofi.sh"
    ["9"]="$script_dir/ulauncher.sh"
    ["10"]="$script_dir/wallpaper.sh"
)

# Display menu in sorted order
echo "================================"
echo "  🔧 Dotfiles Configuration Menu"
echo "================================"
for key in $(printf "%s\n" "${!options[@]}" | sort -n); do
    echo "$key) ${options[$key]}"
done
echo "================================"

# Get user input (multiple selections)
read -p "Enter numbers (e.g., 1 3 5): " -a choices

# Process selections
for choice in "${choices[@]}"; do
    if [[ -n "${options[$choice]}" ]]; then
        if [[ "$choice" == "11" ]]; then
            echo "Exiting..."
            exit 0
        fi
        if [[ -x "${scripts[$choice]}" ]]; then
            echo "Running ${options[$choice]}..."
            bash "${scripts[$choice]}"
        else
            echo "Error: Script for ${options[$choice]} not found or not executable!"
        fi
    else
        echo "Invalid option: $choice"
    fi
done
