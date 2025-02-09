#!/usr/bin/env sh

# Includes setup-utilities only for standalone (direct call)
# use of this script (otherwise the script is called from setup
# and the import is not necessary)
if [ $0 ]; then
  . ../../../utils
fi

log "nix/sys/default.nix"

execute() {
  # all must be prefixed with `nixpkgs.`

 # dust create wm
  SYSTEM=(clipit fswatch inxi iwlist rsync wmctrl xclip xdotool xdpyinfo xprop xkill xrdb xsel zlib)
  install_nix_apps "${SYSTEM[@]}"

  #SYSTEM_EDITORS=(helix)
  #install_nix_apps "${SYSTEM_EDITORS[@]}"

  # https://github.com/sharkdp/fd
  # https://github.com/junegunn/fzf
  # https://github.com/ggreer/the_silver_searcher (ag)
  # https://github.com/BurntSushi/ripgrep (ripgrep-all rga)
  SYSTEM_EXTRA=(bat exa fastfetch fd fzf glow jq jqp neofetch nnn pgrep ripgrep-all silver-searcher tldr up yt-dlp) # (rga ag)
  install_nix_apps "${SYSTEM_EXTRA[@]}"

  SYSTEM_I3=(dunst i3 maim nitrogen picom polybar rofi)
  install_nix_apps "${SYSTEM_I3[@]}"

  # media controls, ...
  SYSTEM_MULTIMEDIA=(amixer feh mpd mpv pavucontrol)
  install_nix_apps "${SYSTEM_MULTIMEDIA[@]}"

  # codecs, ...
  #SYSTEM_MULTIMEDIA_CODECS=(fdk_aac)
  #install_nix_apps "${SYSTEM_MULTIMEDIA_CODECS[@]}"

  # 20 Terminal Tools To Monitor Linux Resource Usage https://www.youtube.com/watch?v=UvADr3FVhZg
  # intel-gpu-tools -> intel_gpu_top
  # sysstat -> iostat -wm 1
  SYSTEM_MONITORS=(atop bandwhich dstat glances htop iftop intel-gpu-tools iotop ncdu nmon nvtopPackages.full powertop s-tui sysstat) # nvidia-smi 
  install_nix_apps "${SYSTEM_MONITORS[@]}"

  # iptraf-ng
  SYSTEM_NETWORK=(curl ethtool netscanner nload wget)
  install_nix_apps "${SYSTEM_NETWORK[@]}"

  # auto-cpufreq v2.0 release & demo of all available features and options https://www.youtube.com/watch?v=SPGpkZ0AZVU
  SYSTEM_POWER_MANAGEMENT=(acpi acpilight acpitool auto-cpufreq glances gsmartcontrol hdparm lm-sensors rmlint smartmontools tlp) 
  install_nix_apps "${SYSTEM_POWER_MANAGEMENT[@]}"

  SYSTEM_SHELL=(fish zsh)
  install_nix_apps "${SYSTEM_SHELL[@]}"
  
  #  localsend gnome-extensions-cli
  SYSTEM=(inxi)
  install_nix_apps "${SYSTEM[@]}"

  # warp-terminal wezterm
  SYSTEM_TERMINALS=(kitty) 
  install_nix_apps "${SYSTEM_TERMINALS[@]}"
  # icons, themes
  # gnomeExtensions.settingscenter

  # https://christitus.com/nix-package-manager/
  #ln -s $HOME/.nix-profile/share/applications/* $HOME/.local/share/applications/
}

execute

