{
  description = "My nix configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
  };

  outputs = {self, nixpkgs, ...}@inputs: {
    nixosConfiguration = {
    nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
	./configuration.nix

      ];
    };

};
  };

}
