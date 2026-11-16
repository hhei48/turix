{
  description = "Hadrian's Workstation";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    # nix = {
    #   url = "github:NixOS/nix/2.35.6";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    home-manager = {
      url= "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    vicinae.url = "github:vicinaehq/vicinae";
    # vicinae-extensions = {
    #   url = "github.com:vicinaehq/extensions";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
  };

 outputs = inputs@{
    self,
    nixpkgs,
    home-manager,
    vicinae,
    stylix,
    ...
  }: {
    nixosConfigurations.earth = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      system = "x86_64-linux";
      modules = [
        ./nixos/main.nix
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.extraSpecialArgs = { inherit inputs; }; # Access to inputs in home manager
          home-manager.users.hei= import ./home/main.nix;
        }
        stylix.nixosModules.stylix
        vicinae.nixosModules.default
      ];
    };
    homeConfigurations."..." = home-manager.lib.homeManagerConfiguration {
      modules = [
        vicinae.homeManagerModules.default
      ];
    };
  };
}
