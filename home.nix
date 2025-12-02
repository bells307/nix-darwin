{ pkgs, ... }:

{
  home.stateVersion = "24.11";

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    extraPackages = with pkgs; [
      stylua
      rust-analyzer
      nil
    ];
  };

  home.file.".config/nvim".source = ./configs/nvim;
  home.file.".tmux.conf".source = ./configs/tmux.conf;
  home.file.".zshrc".source = ./configs/zshrc;
  home.file.".config/kitty".source = ./configs/kitty;
}
