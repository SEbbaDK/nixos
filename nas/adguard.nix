{
  networking.firewall.allowedUDPPorts = [ 53 ];
  networking.firewall.allowedTCPPorts = [ 53 ];
  services.adguardhome.enable = true;
}
