{ config, pkgs, lib, pkgs-unstable, ... }:

let
	dotfiles = "${config.home.homeDirectory}/nixos-config/configs";
	create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
in {
	programs.yazi = {
		enable = true;
		package = pkgs-unstable.yazi;
	};	

	xdg.configFile."yazi" = {
		source = create_symlink "${dotfiles}/yazi";
		recursive = true;
	};
}
