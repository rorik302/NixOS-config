{
  description = "NixOS config";

  inputs = {
	nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-25.11";
	disko = {
		url = "github:nix-community/disko";
		inputs.nixpkgs.follows = "nixpkgs";
	};
	home-manager = {
		url = "github:nix-community/home-manager/release-25.11";
		inputs.nixpkgs.follows = "nixpkgs";
	};
	yandex-browser = {
		url = "github:miuirussia/yandex-browser.nix";
		inputs.nixpkgs.follows = "nixpkgs";
	};
	niri-float-sticky = {
		url = "github:probeldev/niri-float-sticky";
	};
  };

  outputs = inputs@{ self, nixpkgs, ... }: {
	nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
		system = "x86_64-linux";
		modules = [
			./configuration.nix
			inputs.disko.nixosModules.disko
			inputs.home-manager.nixosModules.home-manager
			{
				home-manager = {
					useGlobalPkgs = true;
					useUserPackages = true;
					users.rorik = import ./home.nix;
					backupFileExtension = "backup";
				};
			}
		];
		specialArgs = {
			inherit inputs;
		};
	};
  };
}
