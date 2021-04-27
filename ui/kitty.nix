let
  user = import ../user.nix;
in
{
  home-manager.users.${user}.programs.kitty = {
    enable = true;
    keybindings = {
      "kitty_mod+plus" = "change_font_size all +2.0";
      "ctrl+shift+n" = "new_os_window --cwd=current";
    };
    settings = {
      font_size = 10;
      background_opacity = "0.8";
      enable_bell_sound = false;
    };
  };
}
