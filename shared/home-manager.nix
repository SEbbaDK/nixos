let
  user = import ../user.nix;
in
{ pkgs ? import <nixpkgs> { }, ... }:
{
  home-manager.users.${user} = {
    nixpkgs.config.allowUnfree = true;

    programs.rofi = {
      enable = true;
      terminal = "${pkgs.kitty}/bin/kitty";
      # extraConfig = ''
      #   modi: "combi";
      #   combi-modi: "run,ssh,drun";
      #   case-sensitive: false;
      #   kb-row-up: "Super+k";
      #   kb-row-down: "Super+j";
      # '';
    };

    services.dunst = {
      enable = true;
      settings = {
        global = {
          transparency = 20;
        };
      };
    };

    programs.git = {
      enable = true;
      userName = "SEbbaDK";
      userEmail = "sebbadk@gmail.com";
      extraConfig = {
        pull.ff = "only";
        merge.tool = "vimdiff";
      };
      delta = {
        enable = true;
        options.line-numbers = true;
      };
    };

    services.sxhkd = {
      enable = true;
      keybindings = {
        "XF86Display" = "autorandr -c";
        "super + space" = "notify-send hi";
        "f7" = "notify-send hi";
        "alt + p" = "i3-msg workspace 5";
      };
    };
  };
}
