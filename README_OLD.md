# dotfiles

## New schema

Refer to [TODO](#newschema)

## Install

### Setup Script Development

Switch from [nix](https://nixos.org/download/) to [lix](https://lix.systems/faq/) or [guix](https://guix.gnu.org/)

- [ ] `scripts/setup-utilities#install_packages_nix`
	- [x] create it
	- [ ] test it
- [ ] check where is actually needed to source `setup-utilities`

- [ ] refactor `setup-system-desktop-files`
	- [ ] from `setup-system` to `setup-configs`
		- [ ] fix `scripts/common/kitty` paths/icon
		- [ ] fix `scripts/common/vscode` paths/icon

### Setup

  - install essential distro' tools
  (- if `git` is available
    - continue with first setup
    - otherwise ...)
  - first `setup`
    - setup nix/lix/guix/...
    - install git and apps
    - shell(s)
    - clone dotfiles
  - following `adds`
    - add apps
    - add dotfiles
  - following `updates`
    - update apps
    - update dotfiles

#### Setup System

`scripts/setup-system`

- check if `git` is installed by default
	- [ ] `ClearLinux`
	- [ ] `Solus`
    - use `git` to clone install/setup
- [x] per distro base installation

- [x] `setup-system-desktop-files`
		- [ ] install [nix]()
		- [ ] [Nix Package Manager](https://christitus.com/nix-package-manager/)
			- [x] Programs not showing up in start menu
NIX stores all the `.desktop` files for the programs it installs `@ /home/$USER/.nix-profile/share/applications/` and a simple symlink will fix them not showing up in your start menu.
				- [x] `ln -s /home/$USER/.nix-profile/share/applications/* /home/$USER/.local/share/applications/`
				- [ ] Alacritty
				- [ ] Kitty
				- [ ] vscode
- [x] `setup-system-fonts`
- [x] `setup-system-themes`

- [ ] system
	- [ ] set default shell `scripts/common/setup-system-fish`
		- [ ] check how to retrieve installed via `nix` shell
			- [ ] does `chsh -s` need a `which fish` or just `fish`?
- test and delete distro `git`

#### Setup Configurations

`scripts/setup-configs`

- [ ] configuration
	- [ ] common

- [ ] bin
	- [ ] `git clone https://github.com/maxdevjs/dotfiles-bin ~/.local/bin`

- [ ] apps installation (`setup-nix`)
 	- [ ] apps configuration
 		- [ ] docker
 		- [ ] nnn
 		- [ ] nvim 
 			- [ ] language servers
 				- [ ] automatically install via [williamboman/mason.nvim](https://github.com/williamboman/mason.nvim)?
 				- [ ] automatically setup via [williamboman/mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim)?
 					- [ ] [Automatic server setup (advanced feature)](https://github.com/williamboman/mason-lspconfig.nvim?tab=readme-ov-file#automatic-server-setup-advanced-feature)
 			- [ ] ...
 			- [ ] utilities
 		- [ ] nvm (fish plugin?)
 		- [ ] samba

`scripts/setup-dotfiles`

- [ ] dotfiles
	- [ ] simplify URL, pass only app name
	- [ ] Kitty
		- [x] fix `kitty -v` creates `kitty` empty dir in `$XDG_CONFIG_HOME`
			- [x] find where and how I solved it 😄
				- called `setup_config` as first thing
				 - [ ] can it be solved with global dotfiles clone (`setup-dotfiles`)?
			- [ ] or just clone dotfiles repos above all?

#### Setup Nix

`scripts/nix/setup-nix`

### Updates

#### Update Configs/Dotfiles

#### Update Distro

- create `update` script
	- [ ] add it to `.gitignore`
- [ ] update system itself for specific distro
 - [ ] `sudo swupd update`
 - [ ] `sudo eopkg upgrade` (`-n` dry)
- [ ] update dotfiles 
	- [ ] better to delegate to `setup-dotfiles`
		- simply call it to update
			- instead of single app scripts
- [ ] update apps (`nix`)
	- [ ] `nix-env -u`

## TO-FIX

- desktop files for apps
- [ ] alacritty
	- [ ] `Error: "failed to find suitable GL configuration."`
		- [x] [home-manager to install gui applications on non nix-os distros](https://kbin.social/m/linux@lemmy.ml/t/442769)
- `warp-terminal`
			- [x] [alacritty: failed to find suitable GL configuration when using nix on linux mint #230660](https://github.com/NixOS/nixpkgs/issues/230660)
				- [x] [Nix on GNU/Linux](https://nixos.org/manual/nixpkgs/unstable/#nix-on-gnulinux): If you are using a non-NixOS GNU/Linux/X11 desktop with free software video drivers, consider launching OpenGL-dependent programs from Nixpkgs with Nixpkgs versions of libglvnd and mesa.drivers in LD_LIBRARY_PATH. For Mesa drivers, the Linux kernel version doesn’t have to match nixpkgs.
					- [ ] [nix-community/nixGL](https://github.com/nix-community/nixGL)
						- [ ] [nix-channel (Recommended)](https://github.com/nix-community/nixGL#nix-channel-recommended)
							- [ ] `$ nix-channel --add https://github.com/guibou/nixGL/archive/main.tar.gz nixgl && nix-channel --update`
							- [ ] `$ nix-env -iA nixgl.auto.nixGLDefault`   # or replace `nixGLDefault` with your desired wrapper
- [ ] [warp-terminal](https://www.warp.dev/)
	- [ ] `11:57:03 [ERROR] Exited network logging task due to error opening logfile: No such file or directory (os error 2)`
		- [ ] perhaps due to [Logging into Warp (Required)](https://docs.warp.dev/getting-started/getting-started-with-warp#logging-into-warp-required)?

## TODO

### New schema

- [ ] split (?) in
	- [ ] setup/install/update system repo
		- [ ] set specific one time taks up
			- [ ] samba
			- [ ] ...
	- [ ] setup/install/update dotfiles repo

- install/first setup
	- check os/distro
	- install base env per os/distro
		- nix
		- compilers, git, etc (via nix?)
	- clone dotfiles
		- [ ] refactor `single_repo` and `setup-utilities` to pass only application name (i.e.: `nvim`)
	- setup one-time configs (docker, etc)
		- [ ] docker
		- [ ] [How to permanently switch Caps Lock and Esc](https://askubuntu.com/a/830343)
			- `echo "setxkbmap -option caps:swapescape" >> ~/.profile`
				- [ ] no `swap`, but two `esc`
				- [ ] [How can I remap <CapsLock> to <Escape> in the fish shell?](https://stackoverflow.com/questions/76900152/how-can-i-remap-capslock-to-escape-in-the-fish-shell)
- update
	- system
	- dotfiles (same scripts as per install time)

	
### Fish

- [ ] use `fd` to find a file via `fzf` and open it in `nvim`
	- [x] `nvim (fd -t f -H -p | fzf)`
		- [ ] almost there `nvim (fd -t f -p -a | fzf | if test -f $argv[1]; xargs; else; echo 'I need a file'; end)`

