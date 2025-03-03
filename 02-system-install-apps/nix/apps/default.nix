#!/usr/bin/env sh
cd apps
DIR=$PWD
# Includes setup-utilities only for standalone (direct call)
# use of this script (otherwise the script is called from setup
# and the import is not necessary)
if [ $0 ]; then
  . ../../../utils
fi

log "nix/app/default.nix"

execute() {
  #BROWSERS_CHROME=(google-chrome google-chrome-beta google-chrome-dev)
  #install_nix_apps "${BROWSERS_CHROME[@]}"
	
  #BROWSERS_FIREFOX=(firefox firefox-beta-bin firefox-devedition-bin)
  #install_nix_apps "${BROWSERS_FIREFOX[@]}"
	
  # play-with-mpv
  #BROWSERS_OTHER=(brave opera tor vivaldi vivaldi-ffmpeg-codecs)
  #install_nix_apps "${BROWSERS_OTHER[@]}"

  GAMES=(_2048-in-terminal gnome-2048)
  install_nix_apps "${GAMES[@]}"

  #GRAPHICS=(flameshot gcolor3 gimp inkscape)
  #install_nix_apps "${GRAPHICS[@]}"

  # https://github.com/ebruck/radiotray-ng
  # https://pwmt.org/projects/zathura/
  # displaycal mplayer
  MULTIMEDIA=(ffmpeg imagemagick mpv ncspot pyradio radiotray-ng sox youtube-dl zathura) # tplay yt-dlp
  install_nix_apps "${MULTIMEDIA[@]}"
	
  NEWS=(circumflex newsboat nom)
  install_nix_apps "${NEWS[@]}"

  PRODUCTIVITY=(dooit mutt)
  install_nix_apps "${PRODUCTIVITY[@]}"
	
  # hexchat irssi weechat
  SOCIAL=(toot)
  install_nix_apps "${SOCIAL[@]}"
}

#execute

