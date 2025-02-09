#!/usr/bin/env sh
echo nix/sys/gl.nix

# Includes setup-utilities only for standalone (directly calling)
# use of this script (otherwise the script is called from setup
# and the import is not necessary)
if [ $0 ]
then
. ../../setup-utilities
fi

execute() {
  # https://github.com/nix-community/nixGLDefault
  nix-channel --add https://github.com/nix-community/nixGL/archive/main.tar.gz nixgl && nix-channel --update
  nix-env -iA nixgl.auto.nixGLDefault   # or replace `nixGLDefault` with your desired wrapper
}

execute

