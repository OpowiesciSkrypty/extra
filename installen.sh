#!/bin/bash

# Script installing and configuring Debian system

# Function displaying a question and waiting for user input
ask_question() {
    local answer
    printf "\e[33m%s\e[0m (y/n): " "$1"  # Display question in yellow
    while true; do
        read -rsn1 answer
        if [[ $answer =~ ^[yYnN]$ ]]; then
            printf "%s " "$answer"  # Print answer without moving to a new line
            break
        fi
    done
    echo ""  # Move to a new line
    if [[ $answer == [Yy] ]]; then
        return 0
    else
        return 1
    fi
}

# User questions

clear
printf "\e[34m%s\e[0m\n" "Debian Configuration"  # Display message in blue

if ask_question "Configure audio/video codecs?"; then
    codecs=true
fi
read -rsn1 -p "Press Enter to continue..."
clear
printf "\e[34m%s\e[0m\n" "Debian Configuration"

if ask_question "Install compilation tools?"; then
    compilation=true
fi
read -rsn1 -p "Press Enter to continue..."

clear
printf "\e[34m%s\e[0m\n" "Debian Configuration"

if ask_question "Configure multimedia?"; then
    multimedia=true
fi
read -rsn1 -p "Press Enter to continue..."
clear
printf "\e[34m%s\e[0m\n" "Debian Configuration"

if ask_question "Configure additional elements?"; then
    extra=true
fi
read -rsn1 -p "Press Enter to continue..."
clear

# Running appropriate scripts

if [[ $codecs ]]; then
    echo "Running codecs.sh"
    ./codecs.sh
fi
if [[ $compilation ]]; then
    echo "Running compilation.sh"
    ./compilation.sh
fi
if [[ $multimedia ]]; then
    echo "Running multimedia.sh"
    ./multimedia.sh
fi
if [[ $extra ]]; then
    echo "Running extra.sh"
    ./extra.sh
fi

echo "Configuration completed."
