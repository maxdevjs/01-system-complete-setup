#!/usr/bin/env sh
cd dev
DIR=$PWD
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
	
  # python-neovim ? + for nvim
  EDITORS_NEOVIM=(neovim lua51Packages.lua luajitPackages.luarocks_bootstrap luajitPackages.xml2lua)
  install_nix_apps "${EDITORS_NEOVIM[@]}"
  #nix-env -iA nixpkgs.luajitPackages.luarocks_bootstrap
    
  # for nvim
  DEV_GO=(go)
  install_nix_apps "${DEV_GO[@]}"

  #EDITORS_OTHERS=(helix zed-editor)
  #install_nix_apps "${EDITORS_OTHERS[@]}"
	
  SYSTEM=(nnn tmux)
  install_nix_apps "${SYSTEM[@]}"
	
  # alacritty starship warp-terminal
  TERMINALS=(kitty)
  install_nix_apps "${TERMINALS[@]}"
}

execute

