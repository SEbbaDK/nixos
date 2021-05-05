{ pkgs, ... }:
let
	user = import ../user.nix;
in
{
	home-manager.users.${user}.programs.obs-studio = {
    	enable = true;
		plugins = [
			pkgs.obs-v4l2sink
		];
	};
}
