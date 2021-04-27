let
	user = import ../user.nix;
in
{
	home-manager.users.${user}.programs.qutebrowser = {
		enable = true;
		settings = {
			colors.webpage.darkmode.enabled = true;
		};
	};
}
