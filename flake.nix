{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-darwin = {
      url = "github:LnL7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-index-database = {
      url = "github:Mic92/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # deploy-rs.url = "github:serokell/deploy-rs";
  };

  outputs = { 
    self,
    nixpkgs,
    nix-darwin,
    home-manager,
    nix-index-database,
    # deploy-rs
    ...
    }@inputs:

  let 
    # some vars
  in {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#alma
    darwinConfigurations."alma" = nix-darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      specialArgs = {
        inherit inputs;
      };
      modules = [
        ./machines/darwin
        ./machines/darwin/alma
      ];
    };

    # Deploy to other hosts using deploy-rs
    # https://github.com/notthebee/nix-config/blob/main/machines/darwin/default.nix
    # deploy.nodes = {
    # }
  };
}
