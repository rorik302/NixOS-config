{
  description = "NixOS config";

  inputs = {
	nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-25.11";
	disko = {
		url = "github:nix-community/disko";
		inputs.nixpkgs.follows = "nixpkgs";
	};
	yandex-browser = {
		url = "github:miuirussia/yandex-browser.nix";
		inputs.nixpkgs.follows = "nixpkgs";
	};
  };

  outputs = inputs@{ self, nixpkgs, ... }: {
	nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
		system = "x86_64-linux";
		modules = [
			./configuration.nix
			inputs.disko.nixosModules.disko
		];
		specialArgs = {
			inherit inputs;
		};
	};
  };
}
