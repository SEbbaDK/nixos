let
	user = import ../user.nix;
in
{
	home-manager.users.${user}.services.syncthing.enable = true;
}
