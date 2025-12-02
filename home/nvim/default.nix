{ pkgs, ... }:

{
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

  home.file.".config/nvim".source = ./nvim;
}
