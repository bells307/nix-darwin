{ pkgs, lib, config, self, ... }:

{
  # Host-specific configuration
  networking.hostName = "mac";
  networking.computerName = "mac";
  nixpkgs.hostPlatform = "aarch64-darwin";

  # System version
  system.stateVersion = 6;
  system.configurationRevision = self.rev or self.dirtyRev or null;

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

  # Homebrew configuration
  nix-homebrew = {
    enable = true;
    enableRosetta = true;
    user = "bells";
    autoMigrate = true;
  };

  # System packages
  environment.systemPackages = with pkgs; [
    alacritty
    obsidian
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
  ];

  # Fonts
  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
  ];
}
