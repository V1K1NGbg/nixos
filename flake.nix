{
  description = "V1K1NGbg's flake of a system";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.05";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
  let
    inherit (self) outputs;

    # system = "x86_64-linux";
    
    # pkgs = nixpkgs.legacyPackages.${system};
    #pkgs = import nixpkgs {
    #    inherit system;
    #    config.allowUnfree = true;
    #};

    #stable = import nixpkgs-stable {
    #    inherit system;
    #    config.allowUnfree = true;
    #};
  in
  {
    nixosConfigurations = {
      nixosbtw = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        
        modules = [
          ./hosts/nixosbtw/configuration.nix
        ];
      };
    };

    homeConfigurations = {
      "victor@nixosbtw" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = {inherit inputs outputs;};
        modules = [./hosts/nixosbtw/home.nix];
      };
    };
  };
}
