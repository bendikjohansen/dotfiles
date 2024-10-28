{
	description = "MacOS environment";

	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
	};

	outputs = { self, nixpkgs }:
		let
			system = "aarch64-darwin";
		in {
			k
		}
}
