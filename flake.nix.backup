{
  description = "My system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    inputs@{
      self,
      nix-darwin,
      nixpkgs,
      nix-homebrew,
      home-manager,
    }:
    let
      configuration =
        { pkgs, config, ... }:
        {
          nixpkgs.config.allowUnfree = true;

          # List packages installed in system profile. To search by name, run:
          # $ nix-env -qaP | grep wget
          environment.systemPackages = [
            pkgs.alacritty
            pkgs.mkalias
            pkgs.neovim
            pkgs.tmux
            pkgs.fzf
            pkgs.zoxide
            pkgs.claude-code
            pkgs.obsidian
            pkgs.nixfmt
            pkgs.curl
            pkgs.taplo
          ];

          fonts.packages = with pkgs; [
            nerd-fonts.fira-code
          ];

          # Necessary for using flakes on this system.
          nix.settings.experimental-features = "nix-command flakes";

          # Enable alternative shell support in nix-darwin.
          programs.zsh.enable = true;

          # Define user
          users.users.bells = {
            name = "bells";
            home = "/Users/bells";
          };

          # Set Git commit hash for darwin-version.
          system.configurationRevision = self.rev or self.dirtyRev or null;

          # Used for backwards compatibility, please read the changelog before changing.
          # $ darwin-rebuild changelog
          system.stateVersion = 6;

          # The platform the configuration will be used on.
          nixpkgs.hostPlatform = "aarch64-darwin";
        };
    in
    {
      # Build darwin flake using:
      # $ darwin-rebuild build --flake .#simple
      darwinConfigurations."mac" = nix-darwin.lib.darwinSystem {
        modules = [
          configuration
          nix-homebrew.darwinModules.nix-homebrew
          {
            nix-homebrew = {
              enable = true;
              enableRosetta = true;
              user= "bells";
              autoMigrate = true;
            };
          }
          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";
            home-manager.users.bells = { lib, pkgs, ... }: {
              home.sessionPath = [
                "$HOME/.cargo/bin"
              ];

              home.file.".config/nvim".source = ./configs/nvim;
              home.file.".config/alacritty".source = ./configs/alacritty;
              home.file.".tmux.conf".source = ./configs/tmux.conf;
              home.file.".zshrc".source = ./configs/zshrc;

              home.activation.installRustup = lib.hm.dag.entryAfter ["writeBoundary"] ''
                PATH="$HOME/.cargo/bin:${pkgs.curl}/bin:${pkgs.coreutils}/bin:${pkgs.gnugrep}/bin:$PATH"

                if ! command -v rustup &> /dev/null; then
                  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --no-modify-path
                fi

                if command -v rustup &> /dev/null; then
                  . "$HOME/.cargo/env"
                  if ! rustup component list --installed | grep -q rust-analyzer; then
                    rustup component add rust-analyzer
                  fi
                fi
              '';
            };
          }
        ];
      };
    };
}
