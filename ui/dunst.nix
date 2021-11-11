{ pkgs, ... }:
let
  user = import ../user.nix;
in
{
  home-manager.users.${user} = {
    services.dunst = {
      enable = true;
      settings = {
        global = {
          transparency = 50;

          geometry = "300x0-10+10";
          format = "<b>%s</b>\\n%b";
          separator_height = 10;
          padding = 10;
          horizontal_padding = 10;
          max_icon_size = 32;
          word_wrap = "yes";

          title = "Dunst";
          class = "Dunst";

          dmenu = "${pkgs.rofi}/bin/rofi -dmenu -p dunst";
        };
        normal = {
          background = "#101010";
          foreground = "#F0F0F0";
        };
      };
    };
  };
}
