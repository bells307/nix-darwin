{pkgs, ...}: {
  home.file."Library/Application Support/Cursor/User/keybindings.json".source = ./keybindings.json;
  home.file."Library/Application Support/Cursor/User/settings.json".source = ./settings.json;
  
  home.sessionVariables = {
    RUST_SRC_PATH = "${pkgs.rustPlatform.rustLibSrc}";
  };
}
