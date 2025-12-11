{ config, pkgs, ... }:

{
	home = {
		username = "rorik";
		homeDirectory = "/home/rorik";

		stateVersion = "25.11";
	};

	xdg.configFile."niri" = {
		source = config.lib.file.mkOutOfStoreSymlink "/home/rorik/nixos-config/configs/niri";
		recursive = true;
	};

	xdg.configFile."wl-kbptr" = {
		source = config.lib.file.mkOutOfStoreSymlink "/home/rorik/nixos-config/configs/wl-kbptr";
		recursive = true;
	};
}
