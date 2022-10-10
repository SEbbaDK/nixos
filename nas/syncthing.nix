let
  user = import ../user.nix;
in
{
  networking.firewall.allowedTCPPorts = [ 22000 ];
  networking.firewall.allowedUDPPorts = [ 22000 ];
  services.syncthing = {
    enable = true;
  };
  users.users.${user}.extraGroups = [ "syncthing" ];

  fileSystems."/sync" = {
      device = "/mnt/big/syncthing";
      options = [ "bind" ];
  };
}
