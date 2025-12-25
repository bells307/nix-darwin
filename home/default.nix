{pkgs, ...}: {
  imports = [
    ./nvim
    ./tmux
    ./kitty
    ./zsh
    ./direnv
    ./opencode
    ./git
    ./cursor
  ];

  home.stateVersion = "24.11";

  home.packages = with pkgs; [
    fzf
    zoxide
    yazi
    neofetch
    claude-code
    cursor-cli
    codex
    opencode
    nixfmt
    taplo
    stylua
    rustc
    rustfmt
    nil
    alejandra
    cargo
    cargo-nextest
    rust-analyzer
    rustPlatform.rustLibSrc
    vscode-extensions.vadimcn.vscode-lldb.adapter
    just
    jq
    ripgrep
    somafm-cli
  ];
}
