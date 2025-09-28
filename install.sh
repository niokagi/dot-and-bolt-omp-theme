#!/bin/bash
THEME_FILE_PATH="./theme/dot-and-bolt.omp.json"
THEME_FILENAME="dot-and-bolt.omp.json"

echo -e "\033[0;36mInstalling Dot & Bolt theme for Oh My Posh...\033[0m"

if [ ! -f "$THEME_FILE_PATH" ]; then
    echo -e "\033[0;31mERROR: Theme file '$THEME_FILE_PATH' not found. Make sure you are running this script from the repository's root directory.\033[0m"
    exit 1
fi

if [ -z "$POSH_THEMES_PATH" ]; then
    echo -e "\033[0;31mERROR: The \$POSH_THEMES_PATH environment variable was not found. Please ensure Oh My Posh is installed correctly.\033[0m"
    exit 1
fi

THEMES_PATH=$(dirname "$POSH_THEMES_PATH")

if [ ! -d "$THEMES_PATH" ]; then
    printf "\033[0;31mERROR: Oh My Posh themes directory not found at '%s'.\033[0m\n" "$THEMES_PATH"
    exit 1
fi

# installation
cp "$THEME_FILE_PATH" "$THEMES_PATH/"

if [ $? -eq 0 ]; then
    printf "\033[0;32mTheme successfully copied to: %s\033[0m\n" "$THEMES_PATH"
else
    echo -e "\033[0;31mERROR: Failed to copy the theme file.\033[0m"
    exit 1
fi

THEMES_PATH_BASH="${THEMES_PATH//\\//}"

echo -e "\033[0;32mInstallation Complete!\033[0m\n"
echo -e "\033[0;33mNext, add the following line to your ~/.bashrc, ~/.zshrc, or your shell's configuration file.\033[0m"