{ inputs, pkgs, lib, ... }:
{

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };

  imports = [ inputs.home-manager.darwinModules.home-manager ];
  home-manager = {
    useGlobalPkgs = false; # makes hm use nixos's pkgs value
      extraSpecialArgs = { inherit inputs; }; # allows access to flake inputs in hm modules
      users.azatserikbayev = { config, pkgs, ... }: {
        # nixpkgs.overlays = [ 
        # inputs.nixpkgs-firefox-darwin.overlay
        # inputs.nur.overlay
        # ];
        home = {
          homeDirectory = lib.mkForce "/Users/azatserikbayev";
          
          # The state version is required and should stay at the version you
          # originally installed.
          stateVersion = "24.05";
        };
        
        imports = [
        #   inputs.nix-index-database.hmModules.nix-index
        #   inputs.agenix.homeManagerModules.default
          ../../users/azatserikbayev/dots.nix
        #   ../../users/username/age.nix
        #   ../../dots/tmux
        #   ../../dots/firefox
        #   ../../dots/kitty
        ];
      };

    backupFileExtension = "bak";
    useUserPackages = true;
  };

  nix.settings.max-jobs = "auto";
}