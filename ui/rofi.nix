{ pkgs, ... }:
{
  home-manager.main.programs.rofi = {
    enable = true;
    terminal = "${pkgs.kitty}/bin/kitty";
    theme = "~/.cache/wal/colors-rofi-dark.rasi";
    # extraConfig = ''
    #   modi: "combi";
    #   combi-modi: "run,ssh,drun";
    #   case-sensitive: false;
    #   kb-row-up: "Super+k";
    #   kb-row-down: "Super+j";
    # '';
  };
}
