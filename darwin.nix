{ pkgs, lib, config, self, ... }:

{
  # Host-specific configuration
  networking.hostName = "mac";
  networking.computerName = "mac";
  nixpkgs.hostPlatform = "aarch64-darwin";

  # System version
  system.stateVersion = 6;
  system.configurationRevision = self.rev or self.dirtyRev or null;
  system.primaryUser = "bells";

  # User definition
  users.users.bells = {
    name = "bells";
    home = "/Users/bells";
  };

  # Nix configuration
  nix.settings.experimental-features = "nix-command flakes";

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Shell configuration
  programs.zsh.enable = true;

  # System packages
  environment.systemPackages = with pkgs; [
    # GUI Applications
    alacritty
    obsidian
    telegram-desktop
    vscode
    orbstack
    google-chrome
    raycast
    utm
    chatgpt

    # CLI Tools
    mkalias
    neovim
    tmux
    git
    fzf
    zoxide
    claude-code
    nixfmt
    curl
    taplo
    lazygit
    rustc
    rustup
    cargo
    stylua
    yazi
    somafm-cli
  ];

  # Fonts
  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
  ];

  # larger value => slower repeat
  system.defaults.NSGlobalDomain.KeyRepeat = 1;
  # larger value => longer delay
  system.defaults.NSGlobalDomain.InitialKeyRepeat = 12;

  # Disable macOS Spotlight keyboard shortcuts
  system.defaults.CustomUserPreferences."com.apple.symbolichotkeys" = {
    AppleSymbolicHotKeys = {
      # Disable Spotlight search (Cmd+Space)
      "64" = {
        enabled = false;
        value = {
          parameters = [ 32 49 1048576 ];
          type = "standard";
        };
      };
      # Disable Finder search window (Option+Cmd+Space)
      "65" = {
        enabled = false;
        value = {
          parameters = [ 32 49 1572864 ];
          type = "standard";
        };
      };
    };
  };

  # Make apps visible to Spotlight
  system.activationScripts.applications.text = let
    env = pkgs.buildEnv {
      name = "system-applications";
      paths = config.environment.systemPackages;
      pathsToLink = [ "/Applications" ];
    };
  in
    pkgs.lib.mkForce ''
      echo "setting up /Applications..." >&2
      rm -rf /Applications/Nix\ Apps
      mkdir -p /Applications/Nix\ Apps
      find ${env}/Applications -maxdepth 1 -type l -exec readlink '{}' + |
      while read -r src; do
        app_name=$(basename "$src")
        echo "copying $src" >&2
        ${pkgs.mkalias}/bin/mkalias "$src" "/Applications/Nix Apps/$app_name"
      done
    '';
}
