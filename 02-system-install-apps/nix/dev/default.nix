#!/usr/bin/env sh

# Includes setup-utilities only for standalone (direct call)
# use of this script (otherwise the script is called from setup
# and the import is not necessary)
if [ $0 ]; then
  . ../../../utils
fi

log "nix/dev/default.nix"

execute() {
 # dbeaver sqlitebrowser
  DEV_DATABASES=(lazysql tabiew)
  install_nix_apps "${DEV_DATABASES[@]}"
	
  # docker-compose nerdctl x11docker podman
  DEV_DOCKER=(dive docker lazydocker)
  #install_nix_apps "${DEV_DOCKER[@]}"
	
  # git git-extras git-cola jujutsu
  DEV_GIT=(delta gh lazygit tig) 
  install_nix_apps "${DEV_GIT[@]}"
	
  # insomnia zeal
  DEV_TOOLS=(fx httpie jq silicon yq) 
  install_nix_apps "${DEV_TOOLS[@]}"
	
  # python-neovim ?
  EDITORS_NEOVIM=(neovim)
  install_nix_apps "${EDITORS_NEOVIM[@]}"
	
  #EDITORS_OTHERS=(helix zed-editor)
  #install_nix_apps "${EDITORS_OTHERS[@]}"
	
  SYSTEM=(nnn tmux)
  install_nix_apps "${SYSTEM[@]}"
	
  # alacritty starship warp-terminal
  TERMINALS=(kitty)
  install_nix_apps "${TERMINALS[@]}"
}

execute

