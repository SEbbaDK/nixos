{
  environment.variables.TERMINAL = "kitty";

  home-manager.main.programs.kitty = {
    enable = true;
    keybindings = {
      "kitty_mod+plus" = "change_font_size all +2.0";
      "ctrl+shift+n" = "new_os_window_with_cwd";
    };
    settings = {
      font_size = 10;
      # background_opacity = "0.8";
      background_opacity = "0.95"; # When using picom
      enable_bell_sound = false;
    };
  };
}
