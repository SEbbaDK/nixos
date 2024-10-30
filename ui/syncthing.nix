{
  networking.firewall.allowedTCPPorts = [ 22000 ];
  networking.firewall.allowedUDPPorts = [ 22000 ];
  home-manager.main.services.syncthing.enable = true;
}
