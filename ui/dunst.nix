{ pkgs, ... }:
{
  home-manager.main = {
    services.dunst = {
      enable = true;
      settings = {
        global = {
          transparency = 30;

          geometry = "400x0-10+10";
          format = "<b>%s</b>\\n%b";
          markup = "full";
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
