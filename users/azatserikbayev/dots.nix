{ inputs, lib, config, pkgs,  ... }:
let
  home = {
    username = "azatserikbayev";
    homeDirectory = "/home/azatserikbayev";
    stateVersion = "24.05";
    };
in
{
    nixpkgs = {
    overlays = [
    ];
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };

  home = home;

  imports = [
      ../../dots/zsh/default.nix
    #   ../../dots/nvim/default.nix
    #   ../../dots/neofetch/default.nix
    #   ./git.nix
    #   ./packages.nix
  ];

  programs.nix-index =
  {
    enable = true;
    enableZshIntegration = true;
  };

  programs.home-manager.enable = true;

  systemd.user.startServices = "sd-switch";
}