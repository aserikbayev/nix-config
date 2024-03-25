# nix-config

Configuration files for my NixOS and nix-darwin machines (only nix-darwin, for now).

## Installation

### Step 1. Install nix
Install `nix` using one of the installers:
1. [Official Nix installer from nixos.org](https://nixos.org/download)
2. [Determinate System’s Nix Installer for the shell](https://github.com/DeterminateSystems/nix-installer)
3. [Determinate Systems’s graphical installer for macOS](https://determinate.systems/posts/graphical-nix-installer)

Determinate System’s _shell_ installer:
```
curl \
  --proto '=https' \
  --tlsv1.2 \
  -sSf \
  -L https://install.determinate.systems/nix \
  | sh -s -- install
```


### Step 2. Install the config

There are two ways to install the config.

**Directly from the repository:**
```
nix run nix-darwin -- switch --flake github:aserikbayev/nix-config#alma
```
> I haven't tested this on a clean installation just yet

**Cloning the repository first**
```
git clone https://github.com/aserikbayev/nix-config.git ~/nix-config
cd ~/nix-config
nix run nix-darwin -- switch --flake .
```


## References:
- Installation instructions – [nixcademy](https://nixcademy.com/2024/01/15/nix-on-macos/)
- Main reference for the config files - [notthebee/nix-config](https://github.com/notthebee/nix-config)
- Explanation of the "logout/login cycle" comment in ./darwin/alma/system.nix (turned out it was to apply changes without having to logout) – [article by @zmre](https://medium.com/@zmre/nix-darwin-quick-tip-activate-your-preferences-f69942a93236)
- "The state version is required and should stay at the version you originally installed" – [nix-community](https://nix-community.github.io/home-manager/)
- Error importing home-manager with "<home-manager/nixos>" in ./darwin/default.nix – [discourse.nixos.org](https://discourse.nixos.org/t/basic-question-regarding-home-manager-module-and-flakes/25554)
