{ pkgs, ... }:
let
  user = import ../user.nix;
in
{
  home-manager.users.${user}.programs.rofi = {
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
}
