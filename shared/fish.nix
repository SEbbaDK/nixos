{ pkgs, ... }:
let
	mypkgs = import ../pkgs;
in
{
    users.defaultUserShell = pkgs.fish;
    environment.shellAliases.nix-shell = "nix-shell --run fish";
	programs.fish = {
		enable = true;

		interactiveShellInit = ''
			set fish_greeting
		'';

		promptInit = ''
			function fish_prompt
				barion $status
				echo -e "\\e[1m\$\\e[m "
			end
		'';
	};
}
