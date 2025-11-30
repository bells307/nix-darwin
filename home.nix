{ lib, pkgs, config, ... }:

{
  home.stateVersion = "24.11";

  home.sessionPath = [
    "$HOME/.cargo/bin"
  ];

  # Dotfile symlinks
  home.file.".config/nvim".source = ./configs/nvim;
  home.file.".tmux.conf".source = ./configs/tmux.conf;
  home.file.".zshrc".source = ./configs/zshrc;
  home.file.".config/alacritty".source = ./configs/alacritty;

  # Rust development environment
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
}
