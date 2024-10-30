{ config, ... }:
{
  networking.firewall.allowedTCPPorts = [ 22000 ];
  networking.firewall.allowedUDPPorts = [ 22000 ];
  services.syncthing = {
    enable = true;
  };
  users.users.${config.users.main}.extraGroups = [ "syncthing" ];

  fileSystems."/sync" = {
      device = "/mnt/big/syncthing";
      options = [ "bind" ];
  };
}
