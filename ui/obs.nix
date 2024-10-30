{ pkgs, ... }:
{
	home-manager.main.programs.obs-studio = {
    	enable = true;
		# plugins = [
		# 	pkgs.obs-v4l2sink
		# ];
	};
}
