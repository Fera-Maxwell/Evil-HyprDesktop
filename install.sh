#!/usr/bin/env bash
typewrite() {
    local color="$1"
    local delay="$2"
    local text="$3"
    echo -ne "$color"
    for (( i=0; i<${#text}; i++ )); do
        echo -n "${text:$i:1}"
        sleep "$delay"
    done
    echo -e "\e[0m"
}

WHITE="\e[1;37m"
GREEN="\e[1;32m"
BLUE="\e[1;34m"
RED="\e[1;31m"
RESET="\e[0m"

clear
typewrite "$WHITE" 0.03 "Initializing HyprDesktop (Ant-Bloody) Deployment..."
sleep 0.5

REPO_DIR=$(pwd)

typewrite "$BLUE" 0.03 "Moving configurations to ~/.config..."
mkdir -p "$HOME/.config"
cp -r "$REPO_DIR/.config/"* "$HOME/.config/"

typewrite "$BLUE" 0.03 "Deploying local binaries..."
mkdir -p "$HOME/.local/bin"
cp -r "$REPO_DIR/.local/bin/"* "$HOME/.local/bin/"

typewrite "$BLUE" 0.03 "Deploying Ant-Bloody GTK themes..."
mkdir -p "$HOME/.themes"
cp -r "$REPO_DIR/.themes/"* "$HOME/.themes/"

typewrite "$BLUE" 0.03 "Copying scripts and assets..."
mkdir -p "$HOME/CRASHSTUFF"
cp -r "$REPO_DIR/CRASHSTUFF/"* "$HOME/CRASHSTUFF/"

typewrite "$BLUE" 0.03 "Setting up wallpaper directory..."
mkdir -p "$HOME/Pictures/backgrounds"
cp -r "$REPO_DIR/Pictures/backgrounds/"* "$HOME/Pictures/backgrounds/"

if [ -d "$HOME/.config/gtk-4.0" ]; then
    typewrite "$WHITE" 0.03 "Patching GTK-4.0 symlinks for current user..."
    cd "$HOME/.config/gtk-4.0"
    rm -f assets gtk.css gtk-dark.css
    ln -s ../../.themes/Ant-Bloody-Final/gtk-4.0/assets assets
    ln -s ../../.themes/Ant-Bloody-Final/gtk-4.0/gtk.css gtk.css
    ln -s ../../.themes/Ant-Bloody-Final/gtk-4.0/gtk-dark.css gtk-dark.css
    cd "$REPO_DIR"
fi

typewrite "$BLUE" 0.03 "Installing the FONT"
mkdir -p $HOME/.local/share/fonts/
cp $REPO_DIR/Monocraft.ttc $HOME/.local/share/fonts/
fc-cache -fv >/dev/null 2>&1

typewrite "$WHITE" 0.05 "We have a .bashrc if you want to 100% get the config, do you confirm? (y/n)"
typewrite "$WHITE" 0.05 "Don't worry, we will RENAME your old bashrc into '.bashrc.bak'"
typewrite "$RED" 0.1 "(Y/N)"

# Wait for input
read -p "> " confirm

if [[ "$confirm" =~ ^[Yy]$ ]]; then
    typewrite "$BLUE" 0.03 "Backing up and deploying new .bashrc..."
    [ -f "$HOME/.bashrc" ] && mv "$HOME/.bashrc" "$HOME/.bashrc.bak"
    cp "$REPO_DIR/.bashrc" "$HOME/.bashrc"
else
    typewrite "$RED" 0.03 "Skipping .bashrc deployment. Keeping your soul intact..."
fi

echo -e "\n${GREEN}Deployment Complete!${RESET}"

sleep 2
typewrite "$RED" 0.1 "The blood moon awaits... I'll wait for you at the poles"
sleep 1
clear
exit 0
