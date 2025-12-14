{ config, pkgs, ... }:

let
	dotfiles = "${config.home.homeDirectory}/nixos-config/configs";
	create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
	configs = {
		fish = "fish";
		ghostty = "ghostty";
		niri = "niri";
		wl-kbptr = "wl-kbptr";
	};
in 
{
	home = {
		username = "rorik";
		homeDirectory = "/home/rorik";

		stateVersion = "25.11";
	};

	xdg.configFile = builtins.mapAttrs (name: subpath: {
		source = create_symlink "${dotfiles}/${subpath}";
		recursive = true;
	}) configs;
}
