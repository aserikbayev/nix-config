{ inputs, pkgs, lib, ... }:
{
## I already had a high value (2666) on my working machine, might uncomment if I see lower values on next installations
## what are this values? read: https://wilsonmar.github.io/maximum-limits/
#   environment.shellInit = ''
#     ulimit -n 2048
#     '';

  ## This flake was initially created from
  ## https://github.com/LnL7/nix-darwin/blob/master/modules/examples/flake/flake.nix

  homebrew = {
    enable = true;
    onActivation = {
      # "zap" removes manually installed brews and casks
      cleanup = "zap";
      autoUpdate = true;
      upgrade = true;
    };
    brewPrefix = "/opt/homebrew/bin";
    caskArgs = {
      no_quarantine = true;
    };
    brews = [];
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
  # System-Wide Packages
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    ## Terminal
    neovim
    vim
    tree
    parallel
    curl
    wget
    ripgrep
    fd
    sd
    rsync
    bc
    jq
    just
    ueberzugpp
    eza # A modern, maintained replacement for ls
    neofetch
    tmux
    ncdu
    nmap
    yq
    
    # mosh # mobile shell, replacement for ssh connections
    httpie

    ## git
    gh
    git-lfs
    pre-commit
    bfg-repo-cleaner

    ## ssh
    # openssh
    # ssh-copy-id

    ## age
    # age-plugin-yubikey
    # age
    # agenix

    ## archive
    xz
    zstd
    lz4
    p7zip

    ## programming
    go
    gotools
    gopls
    go-outline
    gopkgs
    gocode-gomod
    godef
    golint
    rustc
    (python311.withPackages(ps: with ps; [ 
    pip 
    jmespath
    requests
    setuptools
    pyyaml
    ]))
    llvm
    vscode

    ## ops
    colima
    docker
    docker-compose
    docker-credential-helpers
    utm
    
    ## idk
    #git-crypt
    #iperf3
    #deploy-rs
    
    sqlite
    pwgen
    gnupg
    
    ## media
    yt-dlp
    ffmpeg
    qpdf
    graphicsmagick
    aria2
    pandoc
    tectonic
    typst
    
    discord
    slack
    mattermost
    
    # sentry-cli
  ];

  fonts = {
    fontDir.enable = true;
    fonts = with pkgs; [
      font-awesome
      twemoji-color-font
      (nerdfonts.override {
        fonts = [
          "Hack"
        ];
      })
    ];
  };

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = lib.mkForce true;
  # nix.package = pkgs.nix;

  nix.gc.interval.Day = 7;

  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";

  # Create /etc/zshrc that loads the nix-darwin environment.
  programs.zsh.enable = true;  # default shell on catalina
  # programs.fish.enable = true;

  # Set Git commit hash for darwin-version. (I've no idea what this does)
  system.configurationRevision = inputs.self.rev or inputs.self.dirtyRev or null;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;
  }