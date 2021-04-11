let
  user = import ../user.nix;
in
{
  home-manager.users.${user} = {
    # programs.rofi.theme = "/home/${user}/.cache/wal/colors-rofi-dark.rasi";
    programs.kitty.extraConfig = "include /home/${user}/.cache/wal/colors-kitty.conf";
    programs.bash.initExtra = ''
      [ -f ~/.cache/wal/colors-tty.sh ] && source ~/.cache/wal/colors-tty.sh
    '';
  };
}
