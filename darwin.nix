{ pkgs, config, self, ... }:

{
  # Host-specific configuration
  networking.hostName = "mac";
  networking.computerName = "mac";
  nixpkgs.hostPlatform = "aarch64-darwin";

  # System version
  system.stateVersion = 6;
  system.configurationRevision = self.rev or self.dirtyRev or null;
  system.primaryUser = "bells";

  # Time zone
  time.timeZone = "Europe/Moscow";

  # Security - Touch ID for sudo (including tmux support)
  security.pam.services.sudo_local = {
    touchIdAuth = true;  # Enable Touch ID authentication
    reattach = true;     # Fix Touch ID not working in tmux/screen
  };

  # User definition
  users.users.bells = {
    name = "bells";
    home = "/Users/bells";
    shell = pkgs.zsh;
    uid = 501;
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
    kitty
    obsidian
    vscode
    orbstack
    google-chrome
    # raycast needs vpn to download
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
    rustfmt
    cargo
    rust-analyzer
    stylua
    yazi
    somafm-cli
    neofetch
    just
    jq
    direnv
    nix-direnv
  ];

  homebrew = {
    enable = true;
    brews = [
      "mas"
    ];
    casks = [
      "virtualbuddy"
      "steam"
      "scroll-reverser"
    ];
    masApps = {
      "Telegram" = 747648890;
      "Pepper VPN" = 6739161385;
      "WireGuard" = 1451685025;
    };
    onActivation.cleanup = "zap";
    onActivation.autoUpdate = true;
    onActivation.upgrade = true;
  };

  # Fonts
  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
  ];

  system.defaults = {
    # dock.autohide = true;
    finder.FXPreferredViewStyle = "clmv";
    loginwindow.GuestEnabled = false;

    NSGlobalDomain = {
      # larger value => slower repeat
      KeyRepeat = 1;
      # larger value => longer delay
      InitialKeyRepeat = 12;
      AppleICUForce24HourTime = true;

      # Disable automatic text substitution
      NSAutomaticCapitalizationEnabled = false;
      NSAutomaticDashSubstitutionEnabled = false;
      NSAutomaticPeriodSubstitutionEnabled = false;
      NSAutomaticQuoteSubstitutionEnabled = false;
      NSAutomaticSpellingCorrectionEnabled = false;
    };

    # Disable macOS Spotlight keyboard shortcuts
    CustomUserPreferences."com.apple.symbolichotkeys" = {
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
  };

  # Install Rosetta 2 for x86_64 compatibility on Apple Silicon
  system.activationScripts.rosetta = ''
    if ! /usr/bin/pgrep -q oahd; then
      echo "Installing Rosetta 2..." >&2
      /usr/sbin/softwareupdate --install-rosetta --agree-to-license
    fi
  '';

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
