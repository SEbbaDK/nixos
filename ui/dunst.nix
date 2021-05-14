let
  user = import ../user.nix;
in
{
  home-manager.users.${user} = {
    services.dunst = {
      enable = true;
      settings = {
        global = {
          transparency = 20;
        };
      };
    };
  };
}
