{pkgs, ...}: {
  home.file."Library/Application Support/Cursor/User/keybindings.json".source = ./keybindings.json;
  
  # settings.json создается только при первом запуске, чтобы Cursor мог его изменять
  # Используем activation hook для создания файла с правильными правами
  home.activation.cursorSettings = ''
    if [ -d "$HOME/Library/Application Support/Cursor/User" ]; then
      SETTINGS_FILE="$HOME/Library/Application Support/Cursor/User/settings.json"
      # Создаем settings.json только если его еще нет
      if [ ! -f "$SETTINGS_FILE" ]; then
        cp "${./settings.json}" "$SETTINGS_FILE"
      fi
      # Убеждаемся, что файл имеет правильные права на запись
      chmod 644 "$SETTINGS_FILE" 2>/dev/null || true
    fi
  '';
  
  home.sessionVariables = {
    RUST_SRC_PATH = "${pkgs.rustPlatform.rustLibSrc}";
  };
}
