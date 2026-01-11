{ config, pkgs, lib, pkgs-unstable, ... }:

let
	dotfiles = "${config.home.homeDirectory}/nixos-config/configs";
	create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
in {
	programs.rofi = {
		enable = true;
	};	

	# xdg.configFile."rofi" = {
	# 	source = create_symlink "${dotfiles}/rofi";
	# 	recursive = true;
	# };
}
