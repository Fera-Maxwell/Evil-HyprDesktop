# EVIL HYPRDESKTOP Repo
---
## Working distros
```
Arch (Of course)
Nix (Maybe)
Gentoo (Yes it does)
Ubuntu (I think so)
Fedora (Yea)
```

## NOT working distros
```
Mint (My friend tried that)
Debian (come on it is too stable)
MXLinux (No shot)
PuppyLinux (Might be a puppy but not good)
```
---

## Dependencies

### ARCH
```bash
sudo pacman -Syu kitty hyprland pcmanfm-qt thunar waybar dunst btop nvim pipewire wireplumber qt5-wayland qt6-wayland polkit-gnome
```
### DEB BASED
```bash
sudo apt update && sudo apt install hyprland waybar kitty dunst btop nvim pcmanfm-qt thunar pipewire-bin gstreamer1.0-plugins-good libpulse0 qt5-style-plugins qt6-gtk-platformtheme
```
### NIX
```conf
programs.hyprland.enable = true;
environment.systemPackages = with pkgs; [
  waybar
  kitty
  dunst
  btop
  neovim
  pcmanfm-qt
  xfce.thunar
  pipewire
  wireplumber
  nwg-look 
  glib
];
```
### FEDORA
```bash
sudo dnf install hyprland waybar kitty dunst btop neovim pcmanfm-qt thunar pipewire-utils
```
### GENTOO
```bash
# add USE "wayland" into your MAKE.CONF

sudo emerge -aqv gui-wm/hyprland gui-apps/waybar x11-terms/kitty gui-apps/dunst sys-process/btop app-editors/neovim x11-misc/pcmanfm-qt x11-fm/thunar media-video/pipewire gui-libs/display-manager-init
```

## Instalation

```bash
# 1. CLONE the repo
git clone https://github.com/Fera-Maxwell/Evil-HyprDesktop.git

# 2. CD into it
cd Evil-HyprDesktop

# 3. Run the INSTALL script
./install
```