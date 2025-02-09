#!/usr/bin/env sh
echo nix/app/default.nix

# Includes setup-utilities only for standalone (directly calling)
# use of this script (otherwise the script is called from setup
# and the import is not necessary)
if [ $0 ]
then
. ../../setup-utilities
fi

execute() {
  # https://codeberg.org/dnkl/fuzzel
  # https://github.com/hyprwm/Hyprland
  # https://github.com/YaLTeR/niri
  # nix run --impure github:guibou/nixGL -- ./results/bin/niri
  # https://github.com/swaywm/sway
  # https://github.com/Alexays/Waybar
  
  # Set up clipboard (cliphist) and history menu (rofi)! Hyprland #1 https://www.youtube.com/watch?v=xZwRpn8AQBw
	PACKAGES=(cliphist fuzzel hyprland niri sway waybar wl-clipboard wofi)
	install_nix_apps "${PACKAGES[@]}"
}

execute

