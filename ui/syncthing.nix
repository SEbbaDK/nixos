let
	user = import ../user.nix;
in
{
  networking.firewall.allowedTCPPorts = [ 22000 ];
  networking.firewall.allowedUDPPorts = [ 22000 ];
  home-manager.users.${user}.services.syncthing.enable = true;
}
