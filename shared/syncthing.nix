let
  user = import ../user.nix;
in
{
  services.syncthing = {
    enable = true;
  };
  users.users.${user}.extraGroups = [ "syncthing" ];
}
