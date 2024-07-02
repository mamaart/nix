{
  description = "NixOS configuration of Martin Maartensson";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    nixvim = {
      url = "github:nix-community/nixvim/nixos-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    impermanence.url = "github:nix-community/impermanence";
  };

  outputs = {nixpkgs, nixvim, home-manager, impermanence, ...}: 
  {
    nixosConfigurations.com = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./hosts/com2
        ./modules/system
        ./macchanger.nix
        ./modules/ui
        home-manager.nixosModules.home-manager
        impermanence.nixosModules.impermanence
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.martin.imports = [
              ./home.nix
              ./modules/editor
              nixvim.homeManagerModules.nixvim
            ];
          };
        }
      ];
    };
  };
}
