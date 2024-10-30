{ config, ... }:
{
  home-manager.main = {
    # programs.rofi.theme = "/home/${user}/.cache/wal/colors-rofi-dark.rasi";
    programs.kitty.extraConfig = "include /home/${config.users.main}/.cache/wal/colors-kitty.conf";
    programs.bash.initExtra = ''
      [ -f ~/.cache/wal/colors-tty.sh ] && source ~/.cache/wal/colors-tty.sh
    '';
  };
}
