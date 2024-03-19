{ inputs, pkgs, lib, ... }:
{
## I already had a high value (2666) on my working machine, might uncomment if I see lower values on next installations
## what are this values? read: https://wilsonmar.github.io/maximum-limits/
#   environment.shellInit = ''
#     ulimit -n 2048
#     '';

  homebrew = {
  enable = true;
  onActivation = {
      autoUpdate = true;
      cleanup = "zap";
      upgrade = true;
  };
  brewPrefix = "/opt/homebrew/bin";
  caskArgs = {
      no_quarantine = true;
  };
  brews = [ "autoenv" ];
  casks = [
      #"telegram"
      "android-commandlinetools"
      "crossover"
      "dbeaver-community"
      "font-hack-nerd-font"
      "gimp"
      "hiddenbar"
      "jetbrains-toolbox"
      "kap"
      "keka"
      "keycastr"
      "krita"
      "openmtp"
      #"podman-desktop"
      "raycast"
      "rectangle"
      "stats"
      "syncthing"
      "time-out"
      "tor-browser"
      "vlc"
      "zotero"
    ];
  };
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    (python311.withPackages(ps: with ps; [ 
    pip 
    jmespath
    requests
    setuptools
    pyyaml
    ]))
    vim
    git-lfs
    pre-commit
    bfg-repo-cleaner
    gh
    go
    gotools
    gopls
    go-outline
    gopkgs
    gocode-gomod
    godef
    golint
    colima
    docker
    docker-compose
    docker-credential-helpers
    utm
    wget
    #git-crypt
    #iperf3
    #deploy-rs
    eza # A modern, maintained replacement for ls
    neofetch
    tmux
    rsync
    ncdu
    nmap
    jq
    yq
    ripgrep
    sqlite
    pwgen
    gnupg
    yt-dlp
    ffmpeg
    # mosh # mobile shell, replacement for ssh connections
    discord
    httpie
    slack
    mattermost
    # sentry-cli
    vscode
    ];

  services.nix-daemon.enable = lib.mkForce true;

  # # Auto upgrade nix package and the daemon service.
  # services.nix-daemon.enable = true;
  # # nix.package = pkgs.nix;

  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";

  # Create /etc/zshrc that loads the nix-darwin environment.
  programs.zsh.enable = true;  # default shell on catalina
  # programs.fish.enable = true;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;
  }