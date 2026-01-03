# EVIL HYPRDESKTOP Repo
---

# $\color{red}{\text{THE BLOOD MOON IS RISING}}$
## $\color{darkred}{\text{THIS SCRIPT ALSO WIPES YOUR "gtk-4.0 gtk-3.0" IN CONFIG}}$

---

## 📸 Screenshots
<details>
  <summary><b>Click to expand the darkness...</b></summary>
  
  ### The Main View
  <img src="https://github.com/Fera-Maxwell/Evil-HyprDesktop/blob/main/screenshots/2026-01-01_08-14-09.png?raw=true" alt="Normal View">

  ### Tiled
  <img src="https://github.com/Fera-Maxwell/Evil-HyprDesktop/blob/main/screenshots/2026-01-01_08-14-42.png?raw=true" alt="Tiled View">

  ### EXE ROFI
  <img src="https://github.com/Fera-Maxwell/Evil-HyprDesktop/blob/main/screenshots/2026-01-03_14-22-00.png?raw=true" alt="Rofi View">
</details>

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
sudo pacman -Syu kitty hyprland pcmanfm-qt thunar waybar dunst btop nvim pipewire wireplumber qt5-wayland qt6-wayland polkit-gnome rofi hyprlock
```
### DEB BASED
```bash
sudo apt update && sudo apt install hyprland waybar kitty dunst btop nvim pcmanfm-qt thunar pipewire-bin gstreamer1.0-plugins-good libpulse0 qt5-style-plugins qt6-gtk-platformtheme rofi hyprlock
```
### NIX
```conf
programs.hyprland.enable = true;
environment.systemPackages = with pkgs; [
  hyprland
  hyprlock
  waybar
  kitty
  dunst
  rofi
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
sudo dnf install hyprland waybar kitty dunst btop neovim pcmanfm-qt thunar pipewire-utils rofi hyprlock
```
### GENTOO
```bash
# add USE "wayland" into your MAKE.CONF

sudo emerge -aqv gui-wm/hyprland gui-wm/hyprlock gui-apps/waybar x11-terms/kitty gui-apps/dunst sys-process/btop app-editors/neovim x11-misc/pcmanfm-qt x11-fm/thunar media-video/pipewire gui-libs/display-manager-init x11-misc/rofi
```

## Instalation

```bash
# 1. CLONE the repo
git clone https://github.com/Fera-Maxwell/Evil-HyprDesktop.git

# 2. CD into it
cd Evil-HyprDesktop

# 3. Run the INSTALL script (If you get a "Permission denied" that means THE BLOOD MOON DOESN'T FIND YOU WORTHY... Or it's because it is not Executable, Run "chmod +x install.sh" to fix it)
./install.sh
```
