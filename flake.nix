{
  description = "Tercy's darwin system";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-23.05-darwin";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager = {
      url = "github:nix-community/home-manager/release-23.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager, ... }: {
    darwinConfigurations."Tercys-MacBook-Air" = nix-darwin.lib.darwinSystem {
      system = "x86_64-darwin";
      modules = [ 
        ./configuration.nix
        {
          users.users.tercyduck.home = "/Users/tercyduck";
        }
        home-manager.darwinModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.tercyduck = import ./home.nix;
        }
      ];
    };
  };
}
