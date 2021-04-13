let
  user = import ../user.nix;
in
{
  home-manager.users.${user}.programs.kakoune = {
    enable = true;
    config = {
      numberLines.enable = true;
      tabStop = 4;
      ui.changeColors = false;
    };
  };
}
