{ pkgs, ... }:
{
	environment.systemPackages = [ pkgs.ranger ];
	environment.etc."ranger/rc.conf" = ''
		set vcs_aware true
		set vcs_backend_git enabled

		set preview_images true
		set preview_images_method kitty

		map gk move to 0
		map gj move to -1
	'';
}
